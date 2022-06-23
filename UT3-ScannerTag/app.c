/***************************************************************************//**
 * @file
 * @brief Core application logic.
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include "em_common.h"
#include "app_assert.h"
#include "sl_bluetooth.h"
#include "gatt_db.h"

#include "app.h"
#include "sl_bt_api.h"
#include "app_assert.h"
#include "sl_sleeptimer.h"
#include "app_log.h"
#include <math.h>

// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;
#define TIMEOUT 32768
#define MEASURED_POWER -41 // dBm


//Code executed when the timer expire.
void start_scanning ( sl_sleeptimer_timer_handle_t *handle, void *data ) {

  (void) (data);
  (void) (handle);
  sl_status_t sc;
  app_log_debug("Starting Scanning...\r\n");

  sc = sl_bt_scanner_set_mode (gap_1m_phy, 0); // 0 mean passive scanning mode

  app_assert(sc == SL_STATUS_OK, "[E: 0x%04x] Failed to set scanner mode \n", (int ) sc);

  // set scan timing
  sc = sl_bt_scanner_set_timing (gap_1m_phy, 200, 200);
  app_assert(sc == SL_STATUS_OK, "[E: 0x%04x] Failed to set scanner timming  \n", (int ) sc);

  // start scanning
  sl_bt_scanner_start (gap_1m_phy, scanner_discover_observation);
  app_log_debug("Scanning Started\r\n");

}

void startScanner () {

  app_log_info("Initializing Scanning Application\r\n");
  sl_status_t status;
  sl_sleeptimer_timer_handle_t my_timer;

  status = sl_sleeptimer_init ();
  if ( status != SL_STATUS_OK ) {

    app_log_error("Sleep Timer Init FAILED Status : %d\r\n", status);

  }
  else {
    app_log_info("Sleep Timer Init Status : %d\r\n", status);
  }

  status = sl_sleeptimer_start_timer (&my_timer, TIMEOUT, start_scanning, (void*) NULL, 0, 0);

  app_log_info("Sleeptimer Start Status : %d\r\n", status);
  app_log_info("Exiting App Init\r\n");

}

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
  bd_addr *remote_address;
  int8_t rssi = 0;
  volatile float power = 0.0;
  volatile float measuredDistane = 0.0;
  uint8_t int_part = 0;
  float frac = 0;
  uint16_t dec_part = 0;
  int temp = 0;

  switch ( SL_BT_MSG_ID(evt->header) ) {
    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
    case sl_bt_evt_system_boot_id:

      // Extract unique ID from BT Address.
      sc = sl_bt_system_get_identity_address (&address,&address_type);

      // Pad and reverse unique ID to get System ID.
      system_id[0] = address.addr[5];
      system_id[1] = address.addr[4];
      system_id[2] = address.addr[3];
      system_id[3] = 0xFF;
      system_id[4] = 0xFE;
      system_id[5] = address.addr[2];
      system_id[6] = address.addr[1];
      system_id[7] = address.addr[0];

      sc = sl_bt_gatt_server_write_attribute_value (gattdb_system_id,0,sizeof(system_id),system_id);

      // Create an advertising set.
      sc = sl_bt_advertiser_create_set (&advertising_set_handle);
//
//      sc = sl_bt_advertiser_set_timing (
//                                        advertising_set_handle,
//                                        160, // min. adv. interval (milliseconds * 1.6)
//                                        160, // max. adv. interval (milliseconds * 1.6)
//                                        0,   // adv. duration
//                                        1);  // max. num. adv. events
      app_assert_status(sc);

      startScanner ();

      break;

      // -------------------------------
      // This event indicates that a new connection was opened.
    case sl_bt_evt_connection_opened_id:
      sl_bt_scanner_stop ();
      break;

      // scan response
    case sl_bt_evt_scanner_scan_report_id:

      // there is no filter here because the LE Coded PHY device is rare
      // add the filter if it is needed
      remote_address = &(evt->data.evt_scanner_scan_report.address);
      //      08:ED:02:C7:00:07 , (remote_address->addr[5]<<40) | (remote_address->addr[4]<<32) |
      uint32_t temp = (remote_address->addr[3] << 24) | (remote_address->addr[2] << 16) | (remote_address->addr[1] << 8)
          | remote_address->addr[0];

      if ( !(temp ^ 0xb6029174) | !(temp ^ 0x14f461da) ) {

        app_log("advertisement/scan response from %2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X",
                remote_address->addr[5],
                remote_address->addr[4],
                remote_address->addr[3],
                remote_address->addr[2],
                remote_address->addr[1],
                remote_address->addr[0]);

        rssi = evt->data.evt_scanner_scan_report.rssi;

        app_log(" | RSSI: %d",
                rssi);
//        power = (-41 - rssi);
//        measuredDistane = pow (10.0,
//                               power);
//
//        int_part = (uint8_t) measuredDistane;
//        frac = measuredDistane - int_part;
//        dec_part = ((uint16_t) (frac * 100));
//
//        app_log(" | Distance: %d.%d",
//                power,
//                dec_part);
//        sl_bt_scanner_stop ();
        app_log(" \r\n");
      }

      break;
      // -------------------------------
      // This event indicates that a connection was closed.
    case sl_bt_evt_connection_closed_id:
      // Restart advertising after client has disconnected.
      sc = sl_bt_advertiser_start (
                                   advertising_set_handle,
                                   sl_bt_advertiser_general_discoverable,
                                   sl_bt_advertiser_connectable_scannable);
      app_assert_status(sc);
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
