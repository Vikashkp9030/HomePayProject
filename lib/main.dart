import 'package:flutter/material.dart';
import 'package:home_pay_project/Screens/Home.dart';
import 'package:home_pay_project/Screens/OTPVerification.dart';
import 'package:home_pay_project/Screens/SignUp.dart';
import 'package:home_pay_project/Screens/Splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}


