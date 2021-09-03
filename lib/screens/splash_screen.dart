import 'package:flutter/material.dart';
import 'package:pass_keep/helper/constants.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_page.dart';

class SplashScreenPage extends StatefulWidget {
  static const id = 'splashScreenPage';

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomePage(),
        title: Text(
          'Pass Keep',
          style: kSplashScreenStyle,
        ),
        image: Image.asset('assets/images/splashScreen.png'),
        backgroundColor: Colors.black,
        photoSize: 160.0,
        loaderColor: Colors.tealAccent);
  }
}
