import serial
import logging
import sys


def setup_custom_logger(name):
  formatter = logging.Formatter(fmt='%(asctime)s %(levelname)-2s   %(message)s',
                                datefmt='%H:%M:%S')
  handler = logging.FileHandler('log.txt', mode='w')
  handler.setFormatter(formatter)
  screen_handler = logging.StreamHandler(stream=sys.stdout)
  screen_handler.setFormatter(formatter)
  logger = logging.getLogger(name)
  logger.setLevel(logging.DEBUG)
  logger.addHandler(handler)
  logger.addHandler(screen_handler)
  return logger


logger = setup_custom_logger('scannerApp')

## CONFIGURATIONS ###############
deviceComPort = 4  # Write Com Port Number here
addressFilter = "50:32:5F:D7:1B:7A"
################################

mySniffer = serial.Serial("COM{}".format(deviceComPort), 9600)

print("\n\n\nStarting Scanner Application............\n")


def checkCRC(rxData, txData):
  return 1
  return (rxData == txData)


try:
  mySniffer.readline()
  mySniffer.readline()
  mySniffer.readline()
  print("CRC Will Always be VALID for this Application")
  while True:
    data = mySniffer.readline().decode('utf-8').strip('\r\n')
    temp = data.split()
    receivedMacAddress = temp[1]
    if receivedMacAddress == addressFilter:
      logger.info("CRC VALID | {}".format(data))
except KeyboardInterrupt:
  print("\n\nExiting.....\n\n")
