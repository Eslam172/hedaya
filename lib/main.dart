import 'package:flutter/material.dart';
import 'package:mushaf/ui/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static late BuildContext appContext;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        appContext = context;
        return '';
      },
      home: HomeScreen(),
    );
  }
}

