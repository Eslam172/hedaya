import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static const String empty = "";
  static const int zero = 0;
  static const double zeroDouble = 0;
  static const int apiTimeOut = 60000;
  static const String defaultLanguage = "ar-EG";
  static const String arLanguage = "ar-EG";
  static const String enLanguage = "en";
  static const String lang = 'lang';
}
 PreferredSizeWidget defaultAppBar(String title,context){
  return AppBar(
    title: Text(title,style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xffFEF5E7)
    ),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon( Icons.arrow_back_ios),
    ),
  );
 }


