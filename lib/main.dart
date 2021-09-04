import 'package:flutter/material.dart';
import 'package:pass_keep/screens/splash_screen.dart';
import 'screens/auth/fingerprint_lock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pass Keep',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreenPage(),
    );
  }
}

