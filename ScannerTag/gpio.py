from gpiozero import LED, Button
from signal import pause

button = Button(4)


def pressed():
  print("Button Pressed")


def depressed():
  print("Button de Pressed")


button.when_pressed = pressed
button.when_released = depressed

pause()
