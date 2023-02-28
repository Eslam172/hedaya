import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              opacity: const AlwaysStoppedAnimation(.6),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 SizedBox(height: 10,),
                  Image.asset('assets/images/quran_icon_2.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                        //color: Colors.transparent,
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                              'assets/images/azkar_2.jpeg',
                              fit: BoxFit.fill,
                              height: 170,
                              width: double.infinity,
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'الأذكار',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Card(
                              //color: Colors.transparent,
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset(
                                    'assets/images/quran_2.jpg',
                                    fit: BoxFit.fill,
                                    height: 220,
                                    width: 150,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    child: Text(
                                      'المصحف',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                              //color: Colors.transparent,
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset(
                                    'assets/images/book_mark.jpg',
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: 142,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    child: Text(
                                      'علامة الوقوف',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                              //color: Colors.transparent,
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset(
                                    'assets/images/prayer.jpg',
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: 142,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    child: Text(
                                      'مواعيد الصلاة',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                              //color: Colors.transparent,
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Image.asset(
                                    'assets/images/kaaba.jpg',
                                    fit: BoxFit.fill,
                                    height: 220,
                                    width: 150,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    child: Text(
                                      'القبلة',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCard({
    required IconData icon,
    required String name,
    required Color color,
    required double width,
    required double height,
  }) {
    return Card(
      color: color,
      elevation: 5,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(name),
              ],
            )
          ],
        ),
      ),
    );
  }
}
