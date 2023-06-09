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
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    useMaterial3: true,
  );

  ///夜间模式
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    iconTheme: const IconThemeData(
      color: Colors.red,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: Colors.tealAccent, unselectedItemColor: Colors.blue),
    colorScheme: ColorScheme.fromSeed(background: Colors.white, seedColor: Colors.black),
  );
}
