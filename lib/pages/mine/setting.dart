import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getxController/theme_controller.dart';
import '../../themes/Themes.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "设置",
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('黑夜模式',style: TextStyle(
                fontSize: 16.sp
              ),),
              trailing:             GetBuilder<ThemeController>(
                  builder: (s) => CupertinoSwitch(
                      value: s.isDarkUiMode.value,
                      onChanged: (value) {
                        Get.changeTheme(s.isDarkUiMode.value ? Themes.lightTheme : Themes.darkTheme);
                        themeController.setIsDarkUiMode(!s.isDarkUiMode.value);
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
