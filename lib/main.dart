import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushaf/ui/home_screen/home_screen.dart';

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
      theme: ThemeData(
        primaryColor: const Color(0xffb07a1a),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xfffffbf2)),
        fontFamily: 'Quran',
        scaffoldBackgroundColor: const Color(0xfffffbf2),
        appBarTheme: const AppBarTheme(
          elevation: 5,
          actionsIconTheme: IconThemeData(
            color: Color(0xfffffbf2),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xffb07a1a),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,

          ),
          color:  Color(0xffb07a1a),
          iconTheme: IconThemeData(
            color: Color(0xfffffbf2),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,

      onGenerateTitle: (context) {
        appContext = context;
        return '';
      },
      home: HomeScreen(),
    );
  }
}

