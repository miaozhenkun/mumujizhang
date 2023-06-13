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
            Container(
              margin: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                headerVisible: false,
                daysOfWeekVisible: true,
                daysOfWeekHeight: 40,
                rowHeight: 58,
                startingDayOfWeek: StartingDayOfWeek.monday,
                pageJumpingEnabled: true,
                daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (DateTime date, locale) {
                      switch (date.weekday) {
                        case 1:
                          return '一';
                        case 2:
                          return '二';
                        case 3:
                          return '三';
                        case 4:
                          return '四';
                        case 5:
                          return '五';
                        case 6:
                          return '六';
                        case 7:
                          return '日';
                      }
                      return '一';
                    },
                    weekdayStyle: const TextStyle(fontWeight: FontWeight.w600),
                    weekendStyle: const TextStyle(fontWeight: FontWeight.w600),
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xfff3f3f3))))),
                calendarBuilders: CalendarBuilders(defaultBuilder: (context, day, day1) {
                  Lunar date = Lunar.fromDate(day);
                  Solar solar = Solar.fromDate(day);
                  String text = date.getDayInChinese();

                  solar.getFestivals().isNotEmpty ? text =  solar.getFestivals()[0]: text= text;
                  date.getJieQi().isNotEmpty ? text =  date.getJieQi(): text= text;
                  date.getFestivals().isNotEmpty ? text =  date.getFestivals()[0]: text= text;

                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  );
                }, selectedBuilder: (context, day, day1) {
                  Lunar date = Lunar.fromDate(day);

                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Get.theme.appBarTheme.backgroundColor, shape: BoxShape.circle),
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        child: Text(
                          DateTime.now().day == day.day ? "今" : day.day.toString(),
                          style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        date.getFestivals().isEmpty ? date.getDayInChinese() : date.getFestivals()[0],
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  );
                }, todayBuilder: (context, day, day1) {
                  Lunar date = Lunar.fromDate(day);
                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        child: Text(
                          '今',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        date.getFestivals().isEmpty ? date.getDayInChinese() : date.getFestivals()[0],
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ],
                  );
                }),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay; // update `_focusedDay` here as well
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
