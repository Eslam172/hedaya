import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:pdfx/pdfx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../app/constants.dart';

class SurahViewBuilder extends StatefulWidget {
  SurahViewBuilder({ required this.pages}) : super();
   final int pages ;


  @override
  _SurahViewBuilderState createState() => _SurahViewBuilderState();
}

class _SurahViewBuilderState extends State<SurahViewBuilder> {
  /// My Document
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
    viewportFraction: .95.sp,

  );

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         backgroundColor: Colors.white,
         body: PdfView(
                  controller: pdfController,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),

                ),
       );


  }

}


