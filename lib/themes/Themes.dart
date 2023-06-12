import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  ///白天模式
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        // 底部导航主要颜色 primary
        primary: Colors.deepPurple),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      backgroundColor: Color(0xffD1C4E9),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
    useMaterial3: true,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xffD1C4E9),
    ),
    scaffoldBackgroundColor: Color(0xfff3f3f3),
  );

  ///夜间模式
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(background: Colors.white, seedColor: Colors.black),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
    useMaterial3: true,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  );
}
