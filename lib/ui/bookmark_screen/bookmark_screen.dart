import 'package:flutter/material.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('علامة الوقوف', context)
      ),
    );
  }
}
