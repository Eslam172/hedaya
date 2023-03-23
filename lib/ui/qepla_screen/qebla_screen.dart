import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/ui/qepla_screen/qipla_compass.dart';

class QeblaScreen extends StatelessWidget {
   QeblaScreen({Key? key}) : super(key: key);
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('القبلة', context),
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
              child:
              Text('{قَدْ نَرَى تَقَلُّبَ وَجْهِكَ فِي السَّمَاءِ فَلَنُوَلِّيَنَّكَ قِبْلَةً تَرْضَاهَا فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَامِ وَحَيْثُ مَا كُنتُمْ فَوَلُّوا وُجُوهَكُمْ شَطْرَهُ وَإِنَّ الَّذِينَ أُوتُوا الْكِتَابَ لَيَعْلَمُونَ أَنَّهُ الْحَقُّ مِنْ رَبِّهِمْ وَمَا اللَّهُ بِغَافِلٍ عَمَّا يَعْمَلُونَ}.\n [سورة البقرة:144]',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontFamily: 'Regular'
                ),
              ),
            ),
            SizedBox(height: 17.h,),
            Center(
              child: FutureBuilder(
                future: _deviceSupport,
                builder: (_, AsyncSnapshot<bool?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Center(
                      child:
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }
                  if (snapshot.data!) {
                    return QiblahCompass();
                  } else {
                    return const Center(
                      child: Text("Your device is not supported"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
