import 'package:flutter/material.dart';

class AppPreCache{

  static Future precache(BuildContext context) async{
    await precacheImage( AssetImage('assets/images/background.jpg'), context).then((value) => true);
    await  precacheImage(  AssetImage('assets/images/azkar_2.jpeg'), context).then((value)
    => true);
    await precacheImage(AssetImage('assets/images/praying_1.png'), context).then((value) => true);
    await precacheImage(AssetImage('assets/images/hedaya_icon.png'), context).then((value) => true);
    await precacheImage(AssetImage('assets/images/hadeeth_2.jpg'), context).then((value) => true);
    await precacheImage(AssetImage('assets/images/quran_2.jpg'), context).then((value) => true);
    await precacheImage(AssetImage('assets/images/prayer.jpg'), context).then((value) => true);
    await precacheImage(AssetImage('assets/images/kaaba.jpg'), context).then((value) => true);
  }
}