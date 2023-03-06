import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/models/surah_model.dart';
import 'package:mushaf/ui/about_screen/about_screen.dart';
import 'package:mushaf/ui/azkar_screen/azkar_screen.dart';
import 'package:mushaf/ui/bookmark_screen/bookmark_screen.dart';
import 'package:mushaf/ui/hadeeth_screen/Hadeeth_screen.dart';
import 'package:mushaf/ui/prayers_screen/prayers_screen.dart';
import 'package:mushaf/ui/qepla_screen/qebla_screen.dart';
import 'package:mushaf/ui/quran_screen/builder/surah_list_builder.dart';
import 'package:mushaf/ui/quran_screen/quran_screen.dart';
import 'package:mushaf/ui/settings_screen/settings_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
      appBar: AppBar(
        title:  Row(
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
              width: 5.w,
            ),
            Image.asset(
              'assets/images/ramadan.png',
              width: 30.w,
              height: 6.h,
            ),
          ],
        ),
      ),
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
          ListTile(
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
                      builder: (context) => const BookmarkScreen()));
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
                        EdgeInsets.only(left: 2.w,right: 2.w, top: 12.h,bottom: 1.h),
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
                            fontSize: 20.sp,
                            fontFamily: 'Mushaf',
                            fontWeight: FontWeight.w500,
                            //color: Theme.of(context).primaryColor,
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
}
