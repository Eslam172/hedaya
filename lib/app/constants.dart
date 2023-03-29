import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class Constants {
  static const String empty = "";
  static const int zero = 0;
  static const double zeroDouble = 0;
  static const int apiTimeOut = 60000;
  static const String defaultLanguage = "ar-EG";
  static const String arLanguage = "ar-EG";
  static const String enLanguage = "en";
  static const String lang = 'lang';
}

 PreferredSizeWidget defaultAppBar(String title,context){
  return AppBar(
    title: Text(title,style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xffFEF5E7)
    ),),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon( Icons.arrow_back_ios),
    ),
  );
 }

Widget buildSlider(){
  return CarouselSlider(
    options: CarouselOptions(
        height: 24.h,
        autoPlay: true,
        animateToClosest: true,
        pauseAutoPlayOnTouch: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.easeInOutCirc,
        viewportFraction: 1,
        initialPage: 0,
        reverse: false,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        scrollDirection: Axis.horizontal

    ),

    items: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            child: Card(
                color: Colors.white,
                elevation: 5,
                shadowColor: Theme.of(context).primaryColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/praying_1.png'),
                        width: 35.w,
                        height: 30.h,
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('أدعية قرآنية',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text(
                              Duaa[i],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 12.sp, fontFamily: 'Regular',
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )

            ),
          );
        },
      );
    }).toList(),
  );
}

 List<String> Duaa  =[
   '(وَقَالَ رَبُّكُمُ ادْعُونِي أَسْتَجِبْ لَكُمْ.)',
   '(وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ فَلْيَسْتَجِيبُواْ لِي وَلْيُؤْمِنُواْ بِي لَعَلَّهُمْ يَرْشُدُونَ.)',
   '( رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ.)',
   '(رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.)',
   '(رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً إِنَّكَ أَنْتَ الْوَهَّابُ.)',
   '(رَبَّنَا مَا خَلَقْتَ هَذَا بَاطِلًا سُبْحَانَكَ فَقِنَا عَذَابَ النَّارِ.)',
  '(رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ.)',
   '(رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ.)',
   '(رَبِّ اشْرَحْ لِي صَدْرِي * وَيَسِّرْ لِي أَمْرِي.)',
   '(لَا إِلَهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ.)',
   '(رَبِّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِيَ.)',
   '(رَبِّ ابْنِ لِي عِنْدَكَ بَيْتًا فِي الْجَنَّةِ.)',
   '(رَبَّنَا أَتْمِمْ لَنَا نُورَنَا وَاغْفِرْ لَنَا إِنَّكَ عَلَى كُلِّ شَيْءٍ قَدِيرٌِ.)',
   '(رَبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرٌُِ.)',
   '(رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ.)',
   '(وَاجْعَلْ لِي لِسَانَ صِدْقٍ فِي الْآخِرِينَ * وَاجْعَلْنِي مِنْ وَرَثَةِ جَنَّةِ النَّعِيمِ.)',
   '(رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًاِ.)',
   '(رَبِّ أَدْخِلْنِي مُدْخَلَ صِدْقٍ وَأَخْرِجْنِي مُخْرَجَ صِدْقٍ وَاجْعَلْ لِي مِنْ لَدُنْكَ سُلْطَانًا نَصِيرًاِ.)',
   '(رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا.)',
   '(رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.)',
   '(وَتُبْ عَلَيْنَا إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ.)',
   '(رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ.)',
   '(رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةًُ.)',
 ];




