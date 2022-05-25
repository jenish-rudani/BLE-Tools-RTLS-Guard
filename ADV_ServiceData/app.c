#include "em_common.h"
#include "sl_app_assert.h"
#include "sl_bluetooth.h"
#include "gatt_db.h"
#include "app.h"
#include "sl_app_log.h"

// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;

/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init ( void )
{
  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application init code here!                         //
  // This is called once during start-up.                                    //
  /////////////////////////////////////////////////////////////////////////////
}

/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
SL_WEAK void app_process_action ( void )
{
  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application code here!                              //
  // This is called infinitely.                                              //
  // Do not call blocking functions from here!                               //
  /////////////////////////////////////////////////////////////////////////////
}

/**************************************************************************//**
 * Bluetooth stack event handler.
 * This overrides the dummy weak implementation.
 *
 * @param[in] evt Event coming from the Bluetooth stack.
 *****************************************************************************/
void sl_bt_on_event ( sl_bt_msg_t *evt )
{
  sl_status_t sc;
  bd_addr address;
  uint8_t address_type;
  uint8_t system_id[8];

  switch ( SL_BT_MSG_ID(evt->header) ) {
    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
    case sl_bt_evt_system_boot_id:

      // Extract unique ID from BT Address.
      sc = sl_bt_system_get_identity_address (&address, &address_type);
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to get Bluetooth address\n",
                    (int)sc);

      // Pad and reverse unique ID to get System ID.
      system_id[0] = address.addr[5];
      system_id[1] = address.addr[4];
      system_id[2] = address.addr[3];
      system_id[3] = 0xFF;
      system_id[4] = 0xFE;
      system_id[5] = address.addr[2];
      system_id[6] = address.addr[1];
      system_id[7] = address.addr[0];

      sc = sl_bt_gatt_server_write_attribute_value (gattdb_system_id,
                                                    0,
                                                    sizeof(system_id),
                                                    system_id);
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to write attribute\n",
                    (int)sc);

      // Create an advertising set.
      sc = sl_bt_advertiser_create_set (&advertising_set_handle);
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to create advertising set\n",
                    (int)sc);
      // Set advertising interval to 100ms.
      sc = sl_bt_advertiser_set_timing (
                                        advertising_set_handle,
                                        1600, // min. adv. interval (milliseconds * 1.6)
          1600, // max. adv. interval (milliseconds * 1.6)
          0,   // adv. duration
          0);  // max. num. adv. events
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to set advertising timing\n",
                    (int)sc);
      advConstructor (advertising_set_handle);
      // Start general advertising and enable connections.
      sc = sl_bt_advertiser_start (
                                   advertising_set_handle,
                                   advertiser_user_data,
                                   advertiser_connectable_scannable);
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to start advertising\n",
                    (int)sc);
      break;

      // -------------------------------
      // This event indicates that a new connection was opened.
    case sl_bt_evt_connection_opened_id:
      break;

      // -------------------------------
      // This event indicates that a connection was closed.
    case sl_bt_evt_connection_closed_id:
      // Restart advertising after client has disconnected.
      sc = sl_bt_advertiser_start (
                                   advertising_set_handle,
                                   advertiser_user_data,
                                   advertiser_connectable_scannable);
      sl_app_assert(sc == SL_STATUS_OK,
                    "[E: 0x%04x] Failed to start advertising\n",
                    (int)sc);
      break;

      ///////////////////////////////////////////////////////////////////////////
      // Add additional event handlers here as your application requires!      //
      ///////////////////////////////////////////////////////////////////////////

      // -------------------------------
      // Default event handler.
    default:
      break;
  }
}

/******************************************************************
 * Advertisement constructor
 * ***************************************************************/
void advConstructor ( uint8_t handle )
{
  sl_status_t sc;
  const uint8_t flag_data = 0x6;
  const uint8_t local_name_data[] = "UT-3";

  uint16_t companySIGMemberId = 0xFCE6; // 0xFCE6 - GuardRFUD's Service Member ID
  uint16_t tempServiceData = 0x05105; // 0xFCE6 - GuardRFUD's Service Member ID
  uint8_t serviceData[sizeof("UT-3") + 1];
  memcpy (serviceData, (uint8_t*) &companySIGMemberId, 2);
  memcpy (serviceData + 2, (uint8_t*) &tempServiceData, 2);
  app_log("%d",sizeof(serviceData));
  ad_element_t ad_elements[] = {
      /* Element 0 */
      {
          .ad_type = flags,
          .len = 1,
          .data = &flag_data
      },
      /* Element 1 */
      {
          .ad_type = complete_local_name,
          .len = sizeof(local_name_data) - 1,
          .data = local_name_data
      },
      /* Element 2 */
      {
          .ad_type = service_data,
          .len = sizeof(serviceData),
          .data = serviceData
      }
  };

  /* Set up advertisement payload with the first 3 elements - 0, 1 and 2 */
  adv_t adv = {
      .adv_handle = handle,
      .adv_packet_type = adv_packet,
      .ele_num = 3,
      .p_element = ad_elements
  };
  sc = construct_adv (&adv, 0);
  if ( sc != SL_STATUS_OK ) {
    sl_app_log ("Check error here [%s:%u]\n", __FILE__, __LINE__);
  }

  /* Set up scan response payload with the last (4th) element */
  adv.adv_handle = handle;
  adv.adv_packet_type = scan_rsp;
  adv.ele_num = 1;
  adv.p_element = &ad_elements[3];

  sc = construct_adv (&adv, 0);
  if ( sc != SL_STATUS_OK ) {
    sl_app_log ("Check error here [%s:%u]\n", __FILE__, __LINE__);
  }
}

sl_status_t construct_adv ( const adv_t *adv, uint8_t ext_adv )
{
  uint8_t amout_bytes = 0, i;
  uint8_t buf[MAX_EXTENDED_ADV_LENGTH] = { 0 };
  sl_status_t sc;

  if ( !adv ) {
    sl_app_log ("input param null, aborting.\n");
    return SL_STATUS_NULL_POINTER;
  }

  for ( i = 0; i < adv->ele_num; i++ ) {
    amout_bytes += adv->p_element[i].len + 2;
    if ( !adv->p_element[i].data ) {
      sl_app_log ("adv unit payload data null, aborting.\n");
      return SL_STATUS_NULL_POINTER;
    }
  }
  if ( ((amout_bytes > MAX_ADV_DATA_LENGTH) && !ext_adv)
      || ((amout_bytes > MAX_EXTENDED_ADV_LENGTH)) ) {
    sl_app_log ("Adv data too long [length = %d], aborting.\n", amout_bytes);
    return SL_STATUS_BT_CTRL_PACKET_TOO_LONG;
  }

  amout_bytes = 0;
  for ( i = 0; i < adv->ele_num; i++ ) {
    buf[amout_bytes++] = adv->p_element[i].len + 1;
    buf[amout_bytes++] = adv->p_element[i].ad_type;
    memcpy (buf + amout_bytes, adv->p_element[i].data, adv->p_element[i].len);
    amout_bytes += adv->p_element[i].len;
  }
  sc = sl_bt_advertiser_set_data (adv->adv_handle, adv->adv_packet_type, amout_bytes, buf);
  sl_app_assert(sc == SL_STATUS_OK,
                "[E: 0x%04x] Failed to set advertising data\n",
                (int)sc);
  return SL_STATUS_OK;
}
