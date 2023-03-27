import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';


class SebhaScreen extends StatefulWidget {

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter =0;
  int angle =0;
  List<String> tasbehList =['سبحان الله','الحمدلله','لا اله الا الله','الله اكبر','سبحان الله وبحمده','سبحان الله العظيم','أستغفر الله وأتوب اليه'];
  int tasbehIndex =0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('السبحة', context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 23.w,top: 8.5.h),
                        child:
                        Center(
                            child: Image.asset(
                              'assets/images/headofsebha.png',
                              height: 10.h,
                              color: Theme.of(context).primaryColor,

                            ))
                    ),
                    InkWell(
                      highlightColor: Color(0xffFEF5E7),
                        overlayColor: MaterialStateProperty.all(Color(0xffFEF5E7)),
                        onTap: (){
                          onSebhaPressed();
                        },
                        child:Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('أنقر للتسبيح',
                                style: TextStyle(
                                  fontSize: 18.sp
                                ),
                              ),
                              Transform.rotate(
                                angle: Math.pi/180*angle,
                                child: Image.asset(
                                  'assets/images/bodyofsebha.png',
                                  height: 23.h,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )


                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 4.h),
                    child: Text(
                      'عدد التسبيحات',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                        fontFamily: 'Regular'
                          ),
                    )),
                SizedBox(height: 3.h,),
                CircleAvatar(
                  radius: 25.sp,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    '$counter',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Regular',
                      color: Colors.white
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.h),
                  padding: EdgeInsets.symmetric(vertical: .5.h, horizontal: 14.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    '${tasbehList[tasbehIndex]}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onSebhaPressed(){
    this.setState(() {
      counter++;
      angle+=40;
      if(counter%33==0){
        tasbehIndex+=1;
        counter = 0;
      }
      if(tasbehIndex==7){
        tasbehIndex=0;
      }
    });
  }
}