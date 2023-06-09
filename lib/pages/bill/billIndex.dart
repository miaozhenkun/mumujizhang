import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../themes/Themes.dart';

class BillIndex extends StatefulWidget {
  const BillIndex({Key? key}) : super(key: key);

  @override
  State<BillIndex> createState() => _BillIndexState();
}

class _BillIndexState extends State<BillIndex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text(
            "账单",
          ),
          centerTitle: true
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print(Get.deviceLocale);
                Get.updateLocale(const Locale('zh', 'CN'));
                Get.changeTheme(Themes.lightTheme);
              },
              child: Text(
                'covid'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(Get.deviceLocale);
                Get.updateLocale(const Locale('en', 'US'));
                Get.changeTheme(Themes.darkTheme);
              },
              child: Text(
                'covid'.tr,
                style: const TextStyle(
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