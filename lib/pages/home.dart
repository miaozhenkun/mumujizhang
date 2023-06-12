import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/Themes.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({Key? key}) : super(key: key);

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "首页",
          ),
          centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // print(Get.deviceLocale);
                // Get.updateLocale(const Locale('zh', 'CN'));
                // Get.changeTheme(Themes.lightTheme);
                Get.changeThemeMode(ThemeMode.light);
              },
              child: Text(
                'covid'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // print(Get.deviceLocale);
                // Get.updateLocale(const Locale('en', 'US'));
                // Get.changeTheme(Themes.darkTheme);
                Get.changeThemeMode(ThemeMode.dark);
              },
              child: Text(
                'covid'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
