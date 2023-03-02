import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('عن التطبيق',style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xfffffbf2)
        ),),
      ),
    );
  }
}
