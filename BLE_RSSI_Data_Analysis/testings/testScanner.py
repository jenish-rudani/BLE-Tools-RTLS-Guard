import serial
import logging
import sys
from gpiozero import LED, Button
from signal import pause
import sounddevice as sd
import soundfile as sf
import time
import numpy as np
import os


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


class Scanner():
  def __init__(self) -> None:
    self.button = Button(4, hold_time=2)
    self.led = LED(14)

    self.staticBeacon = "HolyIoT"

    self.audioFileLocation = "./AudioFile/{}.wav"
    self.resultsDirName = "./results/{}/{}/{}_Degree/"
    self.dataFileName = self.resultsDirName + "{}.csv"

    self.distanceList = ['1m']
    self.orientationList = [0, 90, 180, 270]

    self.mySniffer = serial.Serial("/dev/ttyACM0", 115200)
    self.holyIoT = "FC:E4:FD:19:0C:68"
    self.SB1 = "0C:43:14:F4:61:DA"
    self.SB2 = "0C:43:14:F4:63:8B"

    self.scanFlag = True
    self.measuredPower = -41
    for distance in self.distanceList:
      for orientation in self.orientationList:
        self.mkdir(self.resultsDirName.format(self.staticBeacon, distance, orientation))

  def mkdir(self, dirName):
    # Create target directory & all intermediate directories if don't exists
    try:
      os.makedirs(dirName)
      logger.debug("Directory ", dirName,  " Created ")
    except FileExistsError:
      logger.debug("Directory ", dirName,  " already exists")

  def stopScanning(self):
    print("Stopping Scan")
    self.scanFlag = False
    self.led.off()

  def startScanning(self):
    ################################
    self.button.wait_for_press()
    logger.debug("Button Pressed. Starting Scan")
    calculatedDistance = 0
    measuredPower = -41
    time.sleep(1)

    for distance in self.distanceList:
      for orientation in self.orientationList:
        self.led.on()
        logger.debug("\n\nScanning for distance: {}, Orientation: {}\n\n".format(distance, orientation))
        self.scanFlag = True
        scanCount = 0
        rssiArrayHI1 = []
        rssiArraySB1 = []
        rssiArraySB2 = []
        self.mySniffer.flushInput()
        self.mySniffer.flushInput()
        while self.scanFlag:
          data = self.mySniffer.readline().decode('utf-8').strip('\r\n')
          temp = data.split()
          macAddress = temp[3]
          rssi = temp[6]
          intRssi = int(rssi)
          if(macAddress == self.SB2):
            rssiArraySB2.append(intRssi)
          elif(macAddress == self.SB1):
            rssiArraySB1.append(intRssi)
          elif(macAddress == self.holyIoT):
            rssiArrayHI1.append(intRssi)

          factor = (measuredPower - intRssi) / 42
          calculatedDistance = 10**(factor)
          logger.debug("Count: {} | MAC: {} | RSSI: {} | Distance: {}".format(
              scanCount, macAddress, rssi, calculatedDistance))
          scanCount += 1
          if self.button.is_pressed:
            self.scanFlag = False
            self.led.off()
            time.sleep(1)
        if(len(rssiArraySB1) > 0):
          np.savetxt(self.dataFileName.format(self.staticBeacon, distance, orientation, "SB1"),
                     np.array(rssiArraySB1), fmt='%i', header='rssi')
        if(len(rssiArraySB2) > 0):
          np.savetxt(self.dataFileName.format(self.staticBeacon, distance, orientation, "SB2"),
                     np.array(rssiArraySB2), fmt='%i', header='rssi')
        if(len(rssiArrayHI1) > 0):
          np.savetxt(self.dataFileName.format(self.staticBeacon, distance, orientation, "HI1"),
                     np.array(rssiArrayHI1), fmt='%i', header='rssi')
        self.led.blink(on_time=0.25, off_time=0.24, n=5, background=False)
        self.led.off()
        time.sleep(1)
        self.button.wait_for_press()
        time.sleep(1)

    logger.debug("Stopped Scanning")

  def main(self):
    self.startScanning()


if __name__ == "__main__":
  scannerObj = Scanner()
  scannerObj.main()

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
