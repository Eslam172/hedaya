import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:pdfx/pdfx.dart';


import '../../../app/cache_helper.dart';

class SurahViewBuilder extends StatefulWidget {
  const SurahViewBuilder({super.key,
    required this.pages,
  });

  final int pages;

  @override
  _SurahViewBuilderState createState() => _SurahViewBuilderState();
}

class _SurahViewBuilderState extends State<SurahViewBuilder> {

  ///
  /// Defining PDF Controller
  /// - Let it late to initializing it in initState
  /// - In order to pass [initialPage]
  /// - As it can't be passed in State body
  ///
  late PdfController pdfController;
   Future<PdfDocument> document =PdfDocument.openAsset('assets/pdf/quran.pdf');
  int currentPage = 0;

  @override
  void initState() {
    ///
    /// Initializing [pdfController]
    /// & Passing [initialPage] to start from it
    ///
    pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
      initialPage: widget.pages,
    );
    currentPage = widget.pages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();

  }

  Widget buildScreenContent() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffFFFED5),
        body: PdfView(
          controller: pdfController,
          renderer: (PdfPage page) async => await page.render(
            width: page.width,
            height: page.height*1.3,
            format: PdfPageImageFormat.jpeg,
            quality: 100,
          ),
          onPageChanged: (int index) {
            setState(() {
              currentPage = index;
              CacheHelper.saveData(key: 'stop_mark', value: index);
            });
          },
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}



