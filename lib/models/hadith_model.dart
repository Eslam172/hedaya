import 'package:flutter/cupertino.dart';

class HadithModel {
  int? id;
  String? name;
  HadithModel(this.id, this.name);

  HadithModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Image choosePhoto(){
    if(id ==1){
      return Image(image: AssetImage('assets/images/hadith_1.png'));
    } else if (id ==2){
      return Image(image: AssetImage('assets/images/hadith_2.png'));
    }else if (id ==3){
      return Image(image: AssetImage('assets/images/hadith_3.png'));
    }else if (id ==4){
      return Image(image: AssetImage('assets/images/hadith_4.png'));
    }else if (id ==5){
      return Image(image: AssetImage('assets/images/hadith_5.png'));
    }else if (id ==6){
      return Image(image: AssetImage('assets/images/hadith_6.png'));
    }else if (id ==7){
      return Image(image: AssetImage('assets/images/hadith_7.png'));
    }else
      return Image(image: AssetImage('assets/images/hadith_8.png'));

  }
}