import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/ui/azkar_screen/azkar_screen.dart';
import 'package:mushaf/ui/hadeeth_screen/Hadeeth_screen.dart';
import 'package:mushaf/ui/prayers_screen/prayers_screen.dart';
import 'package:mushaf/ui/qepla_screen/qebla_screen.dart';
import 'package:mushaf/ui/quran_screen/quran_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(context),
      body: Padding(
        padding: EdgeInsets.only(top: 3.h),
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
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.list_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 22.sp,
                            )),
                        SizedBox(
                          width: 20.w,
                        ),
                        Image.asset(
                          'assets/images/quran_icon_2.png',
                          width: 30.w,
                          height: 7.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    customCard(
                        name: 'الأذكار',
                        image: 'assets/images/azkar_2.jpeg',
                        width: double.infinity,
                        height: 20.h,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AzkarScreen()));
                        }),
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QuranScreen()));
                                }),
                            SizedBox(
                              height: 2.h,
                            ),
                            customCard(
                                name: 'الحديث الشريف',
                                image: 'assets/images/hadeeth_2.jpg',
                                width: 41.w,
                                height: 20.h,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HadeethScreen()));
                                }),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Column(
                          children: [
                            customCard(
                                name: 'مواعيد الصلاة',
                                image: 'assets/images/prayer.jpg',
                                width: 41.w,
                                height: 20.h,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PrayersScreen()));
                                }),
                            SizedBox(
                              height: 2.h,
                            ),
                            customCard(
                                name: 'القبلة',
                                image: 'assets/images/kaaba.jpg',
                                width: 41.w,
                                height: 30.h,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QeblaScreen()));
                                }),
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
              onTap: () {
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
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ));
  }

  Widget drawer(context) {
    return Drawer(
      width: 50.w,
      child: ListView(
        children: [
          SizedBox(
            height: 10.h,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'هداية',
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xfffffbf2)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.settings,
                  size: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'الإعدادات',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.bookmark,
                  size: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'علامة الوقوف',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
