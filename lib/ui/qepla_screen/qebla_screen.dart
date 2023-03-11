import 'package:flutter/material.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';

class QeblaScreen extends StatelessWidget {
  const QeblaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('القبلة', context),
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
      ),
    );
  }
}
