import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../themes/Themes.dart';

class AccountingIndex extends StatefulWidget {
  const AccountingIndex({Key? key}) : super(key: key);

  @override
  State<AccountingIndex> createState() => _AccountingIndexState();
}

class _AccountingIndexState extends State<AccountingIndex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                print(Get.deviceLocale);
                Get.updateLocale(const Locale('zh', 'CN'));
                Get.changeTheme(Themes.lightTheme);
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
                print(Get.deviceLocale);
                Get.updateLocale(const Locale('en', 'US'));
                Get.changeTheme(Themes.darkTheme);
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
