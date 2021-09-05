import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pass_keep/screens/splash_screen.dart';

import 'model/master_pin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MasterPinAdapter());

  await Hive.openBox<MasterPin>('MasterPin');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pass Keep',
      theme: ThemeData.dark(),
      home: SplashScreenPage(),
    );
  }
}
