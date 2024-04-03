import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';
// How to use GPIOconfig
/*
GPIOconfig(direction, edge, bias, drive, inverted, label)

Check out the comments in gpio.dart starting at line number 54 for more details for the following:

direction = GPIOdirection.gpioDirIn,
edge = GPIOedge.gpioEdgeNone,
bias = GPIObias.gpioBiasDefault,
drive = GPIOdrive.gpioDriveDefault,
inverted = false,
label = '';
*/

/*
Here are the options for each position.

Hover over your live code for any of these options to get a little more info:

GPIOdirection.gpioDirIn 
GPIOdirection.gpioDirOut
GPIOdirection.gpioDirOutHigh
GPIOdirection.gpioDirOutLow

GPIOedge.gpioEdgeBoth
GPIOedge.gpioEdgeFalling
GPIOedge.gpioEdgeNone  
GPIOedge.gpioEdgeRising

GPIObias.gpioBiasDefault
GPIObias.gpioBiasDisable
GPIObias.gpioBiasPullDown
GPIObias.gpioBiasPullUp

GPIOdrive.gpioDriveDefault
GPIOdrive.gpioDriveOpenDrain
GPIOdrive.gpioDriveOpenSource
*/
class GpioSwitch {
  // ignore: prefer_typing_uninitialized_variables
  static var gpio17;
  void initGpioSwitch() {
    var config = GPIOconfig(GPIOdirection.gpioDirIn, GPIOedge.gpioEdgeNone,
        GPIObias.gpioBiasDefault, GPIOdrive.gpioDriveDefault, false, '17');
    gpio17 = GPIO.advanced(17, config);
  }

  String gpio17ReadSwitch() {
    bool gpio17ReadSwitchValue = gpio17.read();
    debugPrint('gpio17ReadSwitchValue: $gpio17ReadSwitchValue');
    return gpio17ReadSwitchValue.toString();
  }

  void disposeGpio17() {
    gpio17.dispose();
  }
}