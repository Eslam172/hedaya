import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';

class SunanScreen extends StatefulWidget {
  const SunanScreen({Key? key}) : super(key: key);

  @override
  State<SunanScreen> createState() => _SunanScreenState();
}

class _SunanScreenState extends State<SunanScreen> {
  String sunanFormFile = 'Empty';

  Future<String> getRoqia() async {
    String sunan;
    sunan =
    await rootBundle.loadString('assets/text/sunan.txt');
    setState(() {
      sunanFormFile = sunan;
    });
    return sunanFormFile;
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
          appBar: defaultAppBar('سنن مؤكدة', context),
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
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    sunanFormFile,
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Regular',
                      color: Colors.black87,
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