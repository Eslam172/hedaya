import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'dart:convert';

import 'package:mushaf/models/azkar_details_model.dart';

class AzkarDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  const AzkarDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _AzkarDetailScreenState createState() => _AzkarDetailScreenState();
}

class _AzkarDetailScreenState extends State<AzkarDetailScreen> {
  List<AzkarDetailsModel> sectionDetails = [];

  List<int> counter = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  List<IconData> icon = [
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add,
    Icons.add
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();
  }

  Widget buildScreenContent(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(widget.title, context),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 2.w),
          child: buildAzkarList(),
        ),
      ),
    );
  }

  Widget buildAzkarList(){
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
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
                  leading: Column(
                    children: [
                      Text(
                        "عدد المرات",
                        style: TextStyle(
                          fontFamily: 'Regular',
                        ),
                      ),
                      Text(
                        "${sectionDetails[index].count}",
                        style: TextStyle(
                          fontFamily: 'Regular',
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        "${sectionDetails[index].content}",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: 'Regular',
                        ),
                      ),
                      Text(
                        "${sectionDetails[index].description}",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: 'Regular',
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 7.h,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              counter[index]++;
                            });if (icon[index] == Icons.check_circle){
                              counter[index] = sectionDetails[index].count!;
                              Fluttertoast.showToast(
                                msg: "لقد اكملت عدد المرات المذكور",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                fontSize: 13.0.sp,
                              );
                            }
                            else if (counter[index] ==
                                sectionDetails[index].count) {
                              counter[index] = 0;
                              icon[index] = Icons.check_circle;
                            }

                            print(counter[index]);
                          },
                          icon: Icon(
                            icon[index],
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "التكرار",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: 'Regular', color: Colors.white),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '${counter[index]}',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: 'Regular', color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 1.h,
        ),
        itemCount: sectionDetails.length);
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/json/azkar_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarDetailsModel _sectionDetail = AzkarDetailsModel.fromJson(section);

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
