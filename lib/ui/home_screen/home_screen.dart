import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 3.h),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              opacity: const AlwaysStoppedAnimation(.6),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   SizedBox(height: 1.h,),
                    Image.asset('assets/images/quran_icon_2.png',
                      width: 30.w,
                      height: 7.h,
                    ),
                     SizedBox(
                      height: 2.h,
                    ),
                    customCard(
                        name: 'الأذكار',
                        image: 'assets/images/azkar_2.jpeg',
                        width: double.infinity,
                        height: 20.h,
                      onTap: (){

                      }
                    ),
                     SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            customCard(
                                name: 'المصحف',
                                image: 'assets/images/quran_2.jpg',
                                width: 41.w,
                                height: 30.h,
                                onTap: (){

                                }
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            customCard(
                                name: 'الحديث الشريف',
                                image: 'assets/images/hadeeth_2.jpg',
                                width: 41.w,
                                height: 20.h,
                                onTap: (){

                                }
                            ),
                          ],
                        ),
                        SizedBox(width: 6.w,),
                        Column(
                          children: [
                            customCard(
                                name: 'مواعيد الصلاة',
                                image: 'assets/images/prayer.jpg',
                                width: 41.w,
                                height: 20.h,
                                onTap: (){

                                }
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            customCard(
                                name: 'القبلة',
                                image: 'assets/images/kaaba.jpg',
                                width: 41.w,
                                height: 30.h,
                                onTap: (){

                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard({
    required String name,
    required String image,
    required double width,
    required double height,
    required Function onTap,
  }) {
    return Card(
        elevation: 15,
        clipBehavior: Clip.antiAlias,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            InkWell(
              onTap: (){
                onTap();
              },
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                height: height,
                width: width,
              ),
            ),
             Padding(
              padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
              child: Text(
                name,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ));
  }
}
