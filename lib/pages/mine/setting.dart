import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:lunar/calendar/Solar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../getxController/theme_controller.dart';
import '../../themes/Themes.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final ThemeController themeController = Get.put(ThemeController());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  var kToday = DateTime.now();
  late DateTime kFirstDay;
  late DateTime kLastDay;

  @override
  void initState() {
    super.initState();
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
  }

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
              title: Text(
                '黑夜模式',
                style: TextStyle(fontSize: 16.sp),
              ),
              trailing: GetBuilder<ThemeController>(
                  builder: (s) => CupertinoSwitch(
                      value: s.isDarkUiMode.value,
                      onChanged: (value) {
                        Get.changeTheme(s.isDarkUiMode.value ? Themes.lightTheme : Themes.darkTheme);
                        themeController.setIsDarkUiMode(!s.isDarkUiMode.value);
                      })),
            ),
            ListTile(
              onTap: () async {
                Dio dio = Dio();
               var res = await  dio.post("http://123.207.201.182:7001/admin/mobileLogin",data: {
                  "username": "miao",
                  "password": "123456"
                });
                var res1 = await  dio.get("http://123.207.201.182:7001/news",data: {
                  "username": "miao",
                  "password": "123456"
                });
               print(res.statusCode);
               print(res.statusMessage);
               print(res.data);
               print(res.data["code"]);
               print(res.data["message"]);
               print(res.data["data"]);
               print(res1.data["data"][0]["title"]);
               print(res1.data["data"].length);
              },
              title: Text(
                '登录',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
