import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/models/surah_model.dart';
import 'package:mushaf/ui/about_screen/about_screen.dart';
import 'package:mushaf/ui/azkar_screen/azkar_screen.dart';
import 'package:mushaf/ui/bookmark_screen/bookmark_screen.dart';
import 'package:mushaf/ui/prayers_screen/prayers_screen.dart';
import 'package:mushaf/ui/qepla_screen/qebla_screen.dart';
import 'package:mushaf/ui/quran_screen/quran_screen.dart';
import 'package:mushaf/ui/settings_screen/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../app/cache_helper.dart';
import '../hadith_screen/hadith_screen.dart';
import '../quran_screen/builder/surah_view_builder.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textFormFile = 'Empty';
  List<SurahModel> surah=[];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();
  }

  Widget buildScreenContent() {
    return Scaffold(
      appBar: customAppBar(),
      key: scaffoldKey,
      drawer: drawer(context),
      body: Stack(
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
                    height: 4.h,
                  ),
                  buildSlider(),
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
                                             QuranScreen()
                                    )
                                );
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
                                             HadithScreen()));
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    getData();

  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  getData() async {
    String completeQuran;
    completeQuran =
    await rootBundle.loadString('assets/text/complete_quran.txt');
    setState(() {
      textFormFile = completeQuran;
    });
    return textFormFile;
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

  Widget buildSlider(){
    return CarouselSlider(
      options: CarouselOptions(
          height: 24.h,
        autoPlay: true,
        animateToClosest: true,
        pauseAutoPlayOnTouch: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.easeInOutCirc,
        viewportFraction: 1,
        initialPage: 0,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        scrollDirection: Axis.horizontal

      ),

      items: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shadowColor: Theme.of(context).primaryColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/praying_1.png'),
                        width: 35.w,
                        height: 30.h,
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('أدعية مأثورة',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                             Text(
                              Duaa[i],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 12.sp, fontFamily: 'Regular',
                              ),
                               maxLines: 4,
                               overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )

              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget drawer(context) {
    return Drawer(
      width: 55.w,
      child: ListView(
        children: [
          SizedBox(
            height: 20.h,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/hedaya_icon.png',
                    width: 25.w,
                    height: 8.h,
                  ),
                  Text(
                    'هداية',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xfffffbf2)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الإعدادات',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Icon(
                  Icons.settings,
                  size: 18.sp,
                  color: Theme.of(context).primaryColor,
                ),

              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
          if(CacheHelper.getData(key: 'stop_mark',) != null)ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'علامة الوقوف',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Icon(
                  Icons.bookmark,
                  size: 18.sp,
                  color: Theme.of(context).primaryColor,
                ),

              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SurahViewBuilder(
                    pages: CacheHelper.getData(key: 'stop_mark',),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'عن التطبيق',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Icon(
                  Icons.info_outline,
                  size: 18.sp,
                  color: Theme.of(context).primaryColor,
                ),

              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          ),
          ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'دعاء ختم القرءان',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Image.asset(
                    'assets/images/open_hands.png',
                    width: 6.w,
                    height: 6.h,
                    color: Theme.of(context).primaryColor,
                  ),

                ],
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  //clipBehavior: Clip.antiAlias,
                  builder: (context) => Container(
                    margin:
                        EdgeInsets.only(left: 2.w,right: 2.w, top: 20.h,bottom: 1.h),
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    decoration: BoxDecoration(
                       // color: const Color(0xfffffbf2),
                      color: Color(0xffFEF5E7),
                        borderRadius: BorderRadius.circular(35)),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(textFormFile,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Regular',
                            height: .3.h,
                            color: Colors.black
                          ),
                          textAlign: TextAlign.right,
                        )],
                      ),
                    ),
                  ),
                );
              }),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'رقم الإصدار',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  _packageInfo.version,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget customAppBar(){
    return AppBar(
      title:  Image.asset(
        'assets/images/app_icon.png',
        width: 35.w,
        height: 7.h,
      ),
    );
  }

}
