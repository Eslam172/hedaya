
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'dart:convert';

import 'package:mushaf/models/azkar_model.dart';
import 'package:mushaf/ui/azkar_screen/azkar_details_screen.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<AzkarModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenContent();
  }

  Widget buildScreenContent(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(
            "أذكار المسلم",
            context),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildSectionItem(model: sections[index]),
            itemCount: sections.length,
          ),
        ),
      ),
    );
  }

  Widget buildSectionItem({required AzkarModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AzkarDetailScreen(id: model.id!,title: model.name!,)));
      },
      child: buildAzkarCard(
          image: model.choosePhoto(),
        title: model.name,
      ),
    );
  }

  Widget buildAzkarCard({ required Image image, required String? title}){
    return Padding(
      padding:  EdgeInsets.only(top: 1.h),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Theme.of(context).primaryColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        child: Column(
          children: [
            image,
            Text(
              title!,
              style: TextStyle(
                fontSize: 15.0.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Regular',
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/azkar_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkarModel _section = AzkarModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
