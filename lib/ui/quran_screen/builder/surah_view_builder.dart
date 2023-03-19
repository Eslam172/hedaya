import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:pdfx/pdfx.dart';

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

  @override
  void initState() {
    ///
    /// Initializing [pdfController]
    /// & Passing [initialPage] to start from it
    ///
    pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/quran.pdf'),
      //viewportFraction: 1,
      initialPage: widget.pages,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();
  }

  Widget buildScreenContent(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Color(0xffFFFED4),
          body:  Stack(
            alignment: Alignment.topLeft,
            children: [
              PdfView(
                controller: pdfController,
                renderer: (PdfPage page) => page.render(
                  width: page.width*1.4.w,
                  height: page.height.h,
                  format: PdfPageImageFormat.jpeg,
                  quality: 100,
                ),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                //padding : EdgeInsets.zero
              ),

              Padding(
                padding:  EdgeInsets.only(top: 1.h),
                child: IconButton(
                  icon: Icon(Icons.bookmark,
                    size: 40.sp,
                    color: Colors.green.withOpacity(.4),
                  ),
                  onPressed: (){
                    Fluttertoast.showToast(
                      msg: "تم الحفظ",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      fontSize: 13.0.sp,
                    );
                  },

                ),
              ),
            ],
          )
        // FutureBuilder<PdfDocument>(
        //   future:document ,
        //   builder: (context, snapshot){
        //
        //     if(snapshot.hasData){
        //       print('true success');
        //       return  PdfView(
        //         controller: pdfController,
        //         renderer: (PdfPage page) => page.render(
        //           width: page.width*1.42.w,
        //           height: page.height*1.h,
        //           format: PdfPageImageFormat.jpeg,
        //           quality: 100,
        //         ),
        //         scrollDirection: Axis.horizontal,
        //         physics: BouncingScrollPhysics(),
        //         //padding : EdgeInsets.zero
        //       );
        //
        //     }else if(snapshot.hasError){
        //       print('false error');
        //       return Text('this is some error');
        //     } else {
        //       print('true load');
        //       Center(
        //         child: CircularProgressIndicator(
        //           color: Theme.of(context).primaryColor,
        //         ),
        //       );
        //     }
        //     return Text('data');
        //   },
        // ),
      ),
    );
  }
}


