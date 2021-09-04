import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pass_keep/screens/auth/fingerprint_lock_screen.dart';
import 'package:pass_keep/screens/auth/setup_pin_screen.dart';

import '../boxes.dart';

class SplashScreenPage extends StatefulWidget {
  static const id = 'splashScreenPage';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isKey = false;
  final box = Boxes.getMasterPin();

  @override
  void initState() {
    var pin = box.get('key');
    if (pin != null) {
      isKey = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splashScreen.png',
      nextScreen: isKey ? FingerPrintAuth() : SetPinScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.black,
      splashIconSize: 200,
      duration: 1000,
    );
  }
}
