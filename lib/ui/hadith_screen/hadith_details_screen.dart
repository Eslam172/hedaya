import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'dart:convert';

import 'package:mushaf/models/azkar_details_model.dart';
import 'package:mushaf/models/hadith_details_model.dart';

class HadithDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const HadithDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _HadithDetailScreenState createState() => _HadithDetailScreenState();
}

class _HadithDetailScreenState extends State<HadithDetailScreen> {
  List<HadithDetailsModel> sectionDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(widget.title, context),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.w),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 5,
                  shadowColor: Theme.of(context).primaryColor,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ListTile(
                    title: Text(
                      "${sectionDetails[index].reference}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Regular',
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          "${sectionDetails[index].content}",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 11.sp, fontFamily: 'Regular',

                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    height: 1.h,
                  ),
              itemCount: sectionDetails.length),
        ),
      ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/json/hadith_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        HadithDetailsModel _sectionDetail = HadithDetailsModel.fromJson(section);

        if (_sectionDetail.sectionId == widget.id) {
          sectionDetails.add(_sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
