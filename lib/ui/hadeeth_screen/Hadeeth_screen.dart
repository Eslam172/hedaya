import 'package:flutter/material.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:pdfx/pdfx.dart';

class HadeethScreen extends StatelessWidget {
   HadeethScreen({Key? key}) : super(key: key);
  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
  );
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('الحديث الشريف', context),

      ),
    );
  }
}
