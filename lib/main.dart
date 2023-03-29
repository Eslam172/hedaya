import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/cache_helper.dart';
import 'app/extensions.dart';
import 'app/precache_method.dart';
import 'ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void didChangeDependencies() async{
    await AppPreCache.precache(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: Sizer.navigatorKey,
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
      home: const SplashScreen(),
      // home: Directionality(
      //     textDirection: TextDirection.rtl,
      //     child: HomeScreen()),
    );
  }
}

