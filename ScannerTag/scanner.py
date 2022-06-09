import serial
import logging
import sys
from gpiozero import LED, Button
from signal import pause

button = Button(4)


def setup_custom_logger(name):
  formatter = logging.Formatter(fmt='%(asctime)s %(levelname)-2s   %(message)s',
                                datefmt='%H:%M:%S')
  handler = logging.FileHandler('log_50cm.txt', mode='w')
  handler.setFormatter(formatter)
  screen_handler = logging.StreamHandler(stream=sys.stdout)
  screen_handler.setFormatter(formatter)
  logger = logging.getLogger(name)
  logger.setLevel(logging.DEBUG)
  logger.addHandler(handler)
  logger.addHandler(screen_handler)
  return logger


logger = setup_custom_logger('scannerApp')


print("\n\n\nStarting Scanner Application............\n")


distance = 0
measuredPower = -41


def startScanning():
  ## CONFIGURATIONS ###############
  deviceComPort = 17  # Write Com Port Number here
  addressFilter = "50:32:5F:D7:1B:7A"
  ################################
  print("Starting Scan")
  mySniffer = serial.Serial("/dev/ttyACM0", 9600)
  distance = 0
  measuredPower = -41
  scanCount = 100
  mySniffer.readline()
  mySniffer.readline()
  mySniffer.readline()
  while scanCount > 0:
    data = mySniffer.readline().decode('utf-8').strip('\r\n')
    temp = data.split()
    address = temp[3]
    rssi = temp[6]
    intRssi = int(rssi)
    factor = (measuredPower - intRssi) / 42
    distance = 10**(factor)
    logger.debug("MAC: {} | RSSI: {} | Distance: {}".format(address, rssi, distance))
    scanCount -= 1


button.when_pressed = startScanning

pause()
# power = (-41 - rssi);
#  measuredDistane = pow (10.0,
#                         power);
#  int_part = (uint8_t) measuredDistane;
#  frac = measuredDistane - int_part;
#  dec_part = ((uint16_t) (frac * 100));
#  app_log(" | Distance: %d.%d",
#          power,
#          dec_part);
#  sl_bt_scanner_stop ();
