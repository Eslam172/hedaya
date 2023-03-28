import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../app/cache_helper.dart';

class SurahViewBuilder extends StatefulWidget {
  SurahViewBuilder({
    required this.pages,
  }) : super();

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
    return PDFView(
      initialPage: widget.pages,
    );
  }

  Widget buildScreenContent() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFED5),
        body: Stack(
          children: [
            PdfView(
              controller: pdfController,
              renderer: (PdfPage page) async => await page.render(
                width: page.width * 1.42.w,
                height: page.height * 1.h,
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
              physics: BouncingScrollPhysics(),
            ),
            SafeArea(
              child: Align(
                alignment: currentPage.isEven
                    ? AlignmentDirectional.topStart
                    : AlignmentDirectional.topEnd,
                child: Icon(
                  Icons.bookmark,
                  size: 64.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFView extends StatefulWidget {
  const PDFView({
    required this.initialPage,
    Key? key}) : super(key: key);

  final int initialPage;
  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {

  PdfViewerController controller = PdfViewerController();

  @override
  void initState() {
    controller.jumpToPage(widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFED5),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SfPdfViewerTheme(
                data: SfPdfViewerThemeData(
                  backgroundColor: Color(0xffFFFED5),
                  progressBarColor: Color(0xffffc823),
                ),
                child: SfPdfViewer.asset(
                  'assets/pdf/quran.pdf',
                  controller: controller,
                  pageLayoutMode: PdfPageLayoutMode.single,canShowScrollHead: false,
                  interactionMode: PdfInteractionMode.selection,
                  enableDoubleTapZooming: false,
                  scrollDirection: PdfScrollDirection.horizontal,
                  onPageChanged: (page) {
                    int index = page.newPageNumber;
                    CacheHelper.saveData(key: 'stop_mark', value: index);
                  },
                  // controller: _pdfViewerController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



