import 'package:flip_clock_flutter/components/clock_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlipClockScreen extends StatefulWidget {
  const FlipClockScreen({super.key});

  @override
  State<FlipClockScreen> createState() => _FlipClockScreenState();
}

class _FlipClockScreenState extends State<FlipClockScreen> {
  var time = DateTime.now();

  @override
  void initState() {
    _updartTime();
    _lockVerticalScreen();
    super.initState();
  }

  void _updartTime() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          time = DateTime.now();
          _updartTime();
        });
      }
    });
  }

  void _lockVerticalScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClockItemWidget(
              text: time.hour.toString().padLeft(2, '0'),
            ),
            const SizedBox(width: 10),
            ClockItemWidget(
              text: time.minute.toString().padLeft(2, '0'),
            ),
            const SizedBox(width: 2),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClockItemWidget(
                  text: time.hour >= 12 ? 'PM' : 'AM',
                  isSmall: true,
                ),
                ClockItemWidget(
                  text: time.second.toString().padLeft(2, '0'),
                  isSmall: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _unlockScreen();
    super.dispose();
  }

  void _unlockScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
