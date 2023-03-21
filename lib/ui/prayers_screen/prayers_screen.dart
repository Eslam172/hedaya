import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/ui/qepla_screen/location_error_widget.dart';

class PrayersScreen extends StatefulWidget {
  const PrayersScreen({Key? key}) : super(key: key);

  @override
  State<PrayersScreen> createState() => _PrayersScreenState();
}

class _PrayersScreenState extends State<PrayersScreen> {
  Location location = new Location();
  LocationData? currentPosition;
  double? latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('مواعيد الصلاة', context),
        // body: FutureBuilder(
        //   future: getLoc(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(
        //           color: Theme.of(context).primaryColor,
        //         ),
        //       );
        //     }
        //
        //
        //   },
        // ),
        body: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return buildSalatScreen();

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: "تم رفض إذن خدمة الموقع",

                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: "تم رفض إذن خدمة الموقع",
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "من فضلك السماح للوصول للموقع",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildSalatScreen(){
    final myCoordinates =
    Coordinates(latitude ?? 26.5564, longitude ?? 31.6949);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/pray_bg.png'),
            width: double.infinity,
            height: 25.h,
            fit: BoxFit.fill,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSalatCard(
                  title: 'صلاة الفجر',
                  salat:DateFormat.jm().format(prayerTimes.fajr) ,
                  color: Color(0xff2c92ab),
                  image: 'assets/images/fajr_1.png'
              ),
              buildSalatCard(
                  title: 'صلاة الشروق',
                  salat:DateFormat.jm().format(prayerTimes.sunrise) ,
                  color: Color(0xff99c5d5),
                  image: 'assets/images/sunrise_1.png'
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSalatCard(
                  title: 'صلاة الظهر',
                  salat:DateFormat.jm().format(prayerTimes.dhuhr) ,
                  color: Color(0xfff9af48),
                  image: 'assets/images/duhr.png'
              ),
              buildSalatCard(
                  title: 'صلاة العصر',
                  salat:DateFormat.jm().format(prayerTimes.asr) ,
                  color: Color(0xfff98d43),
                  image: 'assets/images/sunrise_1.png'
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSalatCard(
                  title: 'صلاة المغرب',
                  salat:DateFormat.jm().format(prayerTimes.maghrib) ,
                  color: Color(0xffdb6699),
                  image: 'assets/images/maghrb.png'
              ),
              buildSalatCard(
                  title: 'صلاة العشاء',
                  salat:DateFormat.jm().format(prayerTimes.isha) ,
                  color: Color(0xff0f4465),
                  image: 'assets/images/fajr_1.png'
              ),
            ],
          ),
          SizedBox(height: 1.h,)
        ],
      ),
    );
  }

  Widget buildSalatCard({required String title,
    required String salat,
    required Color color,
    required String image
  }){
    return SizedBox(
      width: 45.w,
      height: 23.h,
      child: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Card(
          color: color,
          elevation: 5,
          shadowColor: Theme.of(context).primaryColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Image(image: AssetImage(image),
                height: 12.h,
                width: 25.w,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.0.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Regular',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    salat,
                    style: TextStyle(
                      fontSize: 11.0.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Regular',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    // FlutterQiblah().dispose();
  }

  final _locationStreamController = StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    // before running the app please enable your location

    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

}
