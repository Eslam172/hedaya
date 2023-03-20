import 'package:flutter/material.dart';
import 'package:mushaf/app/constants.dart';
import 'package:mushaf/app/extensions.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar('عن التطبيق', context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
            child: Column(
              children: [
                Text('اسأل الله العظيم رب العرش العظيم أن يتقبل منا ومنكم الدعاء وصالح الأعمال ويغفر لموتانا وموتاكم وموتى المسلمين وأن يحسن خاتمتنا إنه على كل شيء قدير .',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    fontFamily: 'Regular'
                  ),
                ),
                SizedBox(height: 2.h,),
                Text('ماذا يوجد داخل نطبيق هداية..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 2.h,),
                buildCustomCard(
                    context,
                    'القرءان الكريم',
                    'يحتوي تطبيق هداية علي القرءان الكريم كاملاً مع وجود معاني لبعض الكلمات في كل صفحه وايضاً أحكام التجويد.'
                ),
                SizedBox(height: 1.h,),
                buildCustomCard(
                    context,
                    'الحديث الشريف',
                    'يحتوي تطبيق هداية علي بعض الأحاديث من كتاب صحيح مسلم والبخاري وغيرهما.'
                ),
                SizedBox(height: 1.h,),
                buildCustomCard(
                    context,
                    'الأذكار',
                    'يحتوي تطبيق هداية علي بعض الأذكار مثل أذكار الصباح والمساء وغيرهما.'
                ),
                SizedBox(height: 1.h,),
                buildCustomCard(
                    context,
                    'مواقيت الصلاة',
                    'يحتوي تطبيق هداية علي مواقيت الصلوات الخمس بحسب كل دولة.'
                ),
                SizedBox(height: 1.h,),
                buildCustomCard(
                    context,
                    'القبلة',
                    'يحتوي تطبيق هداية علي القبلة لمعرفة اتجاه الصلاة.'
                ),
                SizedBox(height: 1.h,),
                buildCustomCard(
                    context,
                    'دعاء ختم القرءان الكريم',
                    'يحتوي تطبيق هداية علي دعاء ختم القرءان الكريم.'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomCard(context,String title, String header){
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Theme.of(context).primaryColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Regular',
                  color: Colors.black,
                ),
              ),
              Text(
                header,
                style: TextStyle(
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Regular',
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
