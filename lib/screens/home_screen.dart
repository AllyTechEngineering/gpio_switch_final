import 'package:flutter/material.dart';
import 'package:gpio_switch_final/src/gpio_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GpioSwitch gpioSwitch = GpioSwitch();
  @override
  void initState() {
    gpioSwitch.initGpioSwitch();
    super.initState();
  }

  @override
  void dispose() {
    gpioSwitch.disposeGpio17();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPIO Advanced'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('GPIO Advanced Controls'),
            const SizedBox(
              height: 20.0,
            ),
            readSwitchElevatedButton(),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget readSwitchElevatedButton() {
    String switchStateValue = gpioSwitch.gpio17ReadSwitch();
    return ElevatedButton(
      onPressed: () {
        setState(() {
          switchStateValue = gpioSwitch.gpio17ReadSwitch();
        });
      },
      child: Text('GPIO17 Switch Status: $switchStateValue'),
    );
  }
}