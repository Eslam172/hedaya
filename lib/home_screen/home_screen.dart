import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.list)),
                  Text('القرءان الكريم'),

                ],
              ),
              SizedBox(height: 20,),
              Text('mushaf icon'),
              SizedBox(height: 20,),
              Card(
                color: Colors.greenAccent.withOpacity(.5),
                elevation: 10,
                clipBehavior: Clip.antiAlias,
               margin: EdgeInsets.symmetric(horizontal: 20),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20),
               ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.book),
                          SizedBox(height: 20,),
                          Text('inspiration'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      customCard(
                          icon: Icons.book_rounded,
                          name: 'Quran',
                          color: Colors.teal.shade300,
                          width: 55,
                          height: 70
                      ),
                      SizedBox(height: 20,),
                      customCard(
                          icon: Icons.book_rounded,
                          name: 'Bookmark',
                          color: Colors.purple.withOpacity(.6),
                          width: 40,
                          height: 30
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      customCard(
                          icon: Icons.book_rounded,
                          name: 'Prayers',
                          color: Colors.pink.withOpacity(.5),
                          width: 50,
                          height: 30
                      ),
                      SizedBox(height: 20,),
                      customCard(
                          icon: Icons.book_rounded,
                          name: 'Qebla',
                          color: Colors.indigo.shade300,
                          width: 55,
                          height: 70
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),

    );
  }

  Widget customCard( {
  required IconData icon,
  required String name,
  required Color color,
  required double width,
  required double height,
}){
    return Card(
      color: color,
      elevation: 5,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width,vertical: height),
        child: Row(
          children: [
            Column(
              children: [
                Icon(icon),
                SizedBox(height: 50,),
                Text(name),
              ],
            )
          ],
        ),
      ),
    );
  }
}
