import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';

class RoqiaScreen extends StatefulWidget {
   RoqiaScreen({Key? key}) : super(key: key);

  @override
  State<RoqiaScreen> createState() => _RoqiaScreenState();
}

class _RoqiaScreenState extends State<RoqiaScreen> {
  String roqiaFormFile = 'Empty';

   Future<String> getRoqia() async {
     String roqia;
     roqia =
     await rootBundle.loadString('assets/text/roqia.txt');
     setState(() {
       roqiaFormFile = roqia;
     });
     return roqiaFormFile;
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoqia();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('الرقية الشرعية', context),
        body: SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.white,
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
            shadowColor: Theme.of(context).primaryColor,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text(
                  roqiaFormFile,
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Regular',
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
