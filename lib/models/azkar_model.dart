import 'package:flutter/cupertino.dart';

class AzkarModel {
  int? id;
  String? name;
  AzkarModel(this.id, this.name);

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Image choosePhoto(){
    if(id ==1){
      return Image(image: AssetImage('assets/images/sunrise.png'));
    } else if (id ==2){
      return Image(image: AssetImage('assets/images/moon.png'));
    }else if (id ==3){
      return Image(image: AssetImage('assets/images/bed.png'));
    }else if (id ==4){
      return Image(image: AssetImage('assets/images/wudhu.png'));
    }else if (id ==5){
      return Image(image: AssetImage('assets/images/mosque.png'));
    }else if (id ==6){
      return Image(image: AssetImage('assets/images/sleeping.png'));
    }else if (id ==7){
      return Image(image: AssetImage('assets/images/eating.png'));
    }else
      return Image(image: AssetImage('assets/images/praise.png'));

  }
}