import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text('بسم الله الرحمن الرحيم',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp
            ),),
          )
        ],
      ),
    );
  }
}
