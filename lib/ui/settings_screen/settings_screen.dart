import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الإعدادات',style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xfffffbf2)
        ),),
      ),
    );
  }
}
