import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mushaf/models/surah_model.dart';

import 'builder/surah_list_builder.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildScreenContent(context);
  }

  Widget buildScreenContent(context){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/surah.json'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SurahModel> surahList = parseJson(snapshot.data.toString());
                return surahList.isNotEmpty
                    ? SurahListBuilder(surah: surahList)
                    : const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: CircularProgressIndicator());
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
    return parsed.map<SurahModel>((json) => SurahModel.fromJson(json)).toList();
  }
}
