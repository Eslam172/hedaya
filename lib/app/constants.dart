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

/// -------------- @Global values
/// changes when onChanged Callback
 int? currentPage;

/// contains bookmarkedPage
int? bookmarkedPage;

/// refer to last viewed page (stored in sharedPreferences)
int? lastViewedPage;

/// Default Screen Brightness level [Default value = 0.5] (medium)
double? brightnessLevel;

/// -------------- @Defaults values
/// if bookmarkedPage not defined
/// Default Bookmarked page equals to surat Al-baqara index [Default value =569] (Reversed)
const DEFAULT_BOOKMARKED_PAGE = 569;

const DEFAULT_BRIGHTNESS_LEVEL = 0.5;

/// -------------- @SharedPreferences Const
const LAST_VIEWED_PAGE = 'lastViewedPage';
const BRIGHTNESS_LEVEL = 'brightness_level';
const BOOKMARKED_PAGE = 'bookmarkedPage';

