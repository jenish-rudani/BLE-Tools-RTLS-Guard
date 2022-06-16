import serial
import logging
import sys
from gpiozero import LED, Button
from signal import pause
import sounddevice as sd
import soundfile as sf
import time
import numpy as np

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

audioFileLocation = "./AudioFile/{}.wav"
dataFileName = "./results/{}cm/{}_Degree/B1.csv"

measuredPower = -41
distanceList = ['3to0', '0to3']
orientationList = [0, 90, 180, 270]


def startScanning():
  ################################
  print("Starting Scan")
  mySniffer = serial.Serial("/dev/ttyACM0", 9600)
  calculatedDistance = 0
  measuredPower = -41
  for distance in distanceList:
    for orientation in orientationList:
      scanCount = 40
      rssiArray = []
      mySniffer.readline()
      mySniffer.readline()
      mySniffer.readline()
      data, fs = sf.read(audioFileLocation.format("started"))
      sd.play(data, fs)
      status = sd.wait()  # Wait until file is done playing
      time.sleep(0.5)
      while scanCount > 0:
        data = mySniffer.readline().decode('utf-8').strip('\r\n')
        temp = data.split()
        address = temp[3]
        rssi = temp[6]
        intRssi = int(rssi)
        rssiArray.append(intRssi)
        factor = (measuredPower - intRssi) / 42
        calculatedDistance = 10**(factor)
        logger.debug("Count: {} | MAC: {} | RSSI: {} | Distance: {}".format(
            40-scanCount, address, rssi, calculatedDistance))
        scanCount -= 1
      np.savetxt(dataFileName.format(distance, orientation),
                 np.array(rssiArray), fmt='%i', header='rssi')
      data, fs = sf.read(audioFileLocation.format(str(orientation) + "_Degree"))
      sd.play(data, fs)
      status = sd.wait()  # Wait until file is done playing
      data, fs = sf.read(audioFileLocation.format("5"))
      sd.play(data, fs)
      status = sd.wait()  # Wait until file is done playing
      time.sleep(8)
      data, fs = sf.read(audioFileLocation.format("2"))
      sd.play(data, fs)
      status = sd.wait()  # Wait until file is done playing
      time.sleep(1)


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
