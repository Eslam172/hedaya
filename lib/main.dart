import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/ui/home_screen/home_screen.dart';
import 'package:mushaf/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static late BuildContext appContext;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: (context, child){
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
        primaryColor: const Color(0xffb07a1a),
        primarySwatch: Colors.amber,

        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffFEF5E7)),
        fontFamily: 'Quran',
        scaffoldBackgroundColor: const Color(0xffFEF5E7),
        appBarTheme: const AppBarTheme(
          elevation: 5,
          centerTitle: true,

          actionsIconTheme: IconThemeData(
            color: Color(0xffFEF5E7),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xffb07a1a),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,

          ),
          color:  Color(0xffb07a1a),
          iconTheme: IconThemeData(
            color: Color(0xffFEF5E7),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,

      onGenerateTitle: (context) {
        appContext = context;
        return '';
      },
      home: const Directionality(
          textDirection: TextDirection.rtl,
          child: SplashScreen()),
    );
  }
}

