import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/models/surah_model.dart';

import 'builder/surah_list_builder.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,

        /// Use future builder and DefaultAssetBundle to load the local JSON file
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/surah.json'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SurahModel> surahList = parseJson(snapshot.data.toString());
                return surahList.isNotEmpty
                    ? new SurahListBuilder(surah: surahList)
                    : new Center(child: new CircularProgressIndicator());
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }),
      ),
    );
  }
  List<SurahModel> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<SurahModel>((json) => new SurahModel.fromJson(json)).toList();
  }
}
