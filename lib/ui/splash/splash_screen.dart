import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/ui/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffbf2),
      body: Center(
          child: Image.asset(
        'assets/images/hedaya_icon.png',
        width: 30.w,
      )),
    );
  }
}
