import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pass_keep/screens/auth/fingerprint_lock_screen.dart';
import 'package:pass_keep/screens/auth/setup_pin_screen.dart';

class SplashScreenPage extends StatefulWidget {
  static const id = 'splashScreenPage';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splashScreen.png',
      nextScreen: FingerPrintAuth(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.black,
      splashIconSize: 200,
      duration: 2000,
    );
  }
}
