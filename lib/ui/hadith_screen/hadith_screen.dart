
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';
import 'dart:convert';
import 'package:mushaf/models/hadith_model.dart';
import 'package:mushaf/ui/hadith_screen/hadith_details_screen.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  _HadithScreenState createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithModel> sections = [];

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
            "الحديث الشريف",
            context),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
          child: buildHadithList(),
        ),
      ),
    );
  }

  Widget buildHadithList(){
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          buildSectionItem(model: sections[index]),
      itemCount: sections.length,
    );
  }

  Widget buildSectionItem({required HadithModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HadithDetailScreen(id: model.id!,title: model.name!,)));
      },
      child: buildHadithCard(
          image: model.choosePhoto(),
        title: model.name,
      ),
    );
  }

  Widget buildHadithCard({ required Image image, required String? title}){
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
        .loadString("assets/json/hadith_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        HadithModel _section = HadithModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
