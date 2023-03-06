import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';
import 'package:mushaf/models/surah_model.dart';

class SurahListBuilder extends StatefulWidget {
    final List<SurahModel> surah;

  SurahListBuilder({required this.surah}) : super();

  @override
  _SurahListBuilderState createState() => _SurahListBuilderState();
}

class _SurahListBuilderState extends State<SurahListBuilder> {
  TextEditingController editingController = TextEditingController();

  List<SurahModel> surah = [];

  void initSurahListView() {
    if (surah.isNotEmpty) {
      surah.clear();
    }
    surah.addAll(widget.surah);
    print(surah.length);
  }

  // void filterSearchResults(String query) {
  //   /// Fill surah list if empty
  //   initSurahListView();
  //
  //   /// SearchList contains every surah
  //   List<Surah> searchList = List<Surah>();
  //   searchList.addAll(surah);
  //
  //   /// Contains matching surah(s)
  //   List<Surah> listData = List<Surah>();
  //   if (query.isNotEmpty) {
  //     /// Loop all surah(s)
  //     searchList.forEach((item) {
  //       /// Filter by (titleAr:exact,title:partial,pageIndex)
  //       if (item.titleAr.contains(query) ||
  //           item.title.toLowerCase().contains(query.toLowerCase()) ||
  //           item.pageIndex.toString().contains(query)) {
  //         listData.add(item);
  //       }
  //     });
  //
  //     /// Fill surah List with searched surah(s)
  //     setState(() {
  //       surah.clear();
  //       surah.addAll(listData);
  //     });
  //     return;
  //
  //     /// Show all surah list
  //   } else {
  //     setState(() {
  //       surah.clear();
  //       surah.addAll(widget.surah);
  //     });
  //   }
  // }

  @override
  void initState() {
    /// Init listView with all surah(s)
    initSurahListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المصحف',style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xffFEF5E7)
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          /// Search field
          buildSearchContainer(),

          /// ListView represent all/searched surah(s)
          Expanded(
            child: buildSurahNameList(),
          ),
        ],
      ),
    );
  }

  Widget buildSearchContainer(){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
      child: TextField(
        cursorColor: Colors.black,

        onChanged: (value) {
          //filterSearchResults(value);
          print(value);
        },
        controller: editingController,

        decoration: InputDecoration(
          labelText: "البحث عن سورة",
          contentPadding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(40)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey.shade500),
            borderRadius: BorderRadius.circular(40)
          ),
          labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500
          ),
          // hintText: "البحث",
          prefixIcon: Icon(Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildSurahNameList(){
    return ListView.builder(
      itemCount: surah.length,
      itemExtent: 9.h,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(surah[index].titleAr!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp
            ),
          ),
          subtitle: Text(surah[index].title!,
            style: TextStyle(
                fontSize: 10.sp
            ),
          ),
          leading: Image(
              image:
              AssetImage("assets/images/${surah[index].place}.png"),
              width: 8.w,
              height: 10.h),
          trailing: Text("${surah[index].pageIndex}",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp
            ),
          ),
          onTap: () {
            /// Push to Quran view ([int pages] represent surah page(reversed index))
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             SurahViewBuilder(pages: surah[index].pages)));
          }),
    );
  }
}