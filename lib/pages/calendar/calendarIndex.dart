import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:lunar/calendar/Solar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarIndex extends StatefulWidget {
  const CalendarIndex({Key? key}) : super(key: key);

  @override
  State<CalendarIndex> createState() => _CalendarIndexState();
}

class _CalendarIndexState extends State<CalendarIndex> with AutomaticKeepAliveClientMixin{
  var kToday = DateTime.now();
  late DateTime kFirstDay;
  late DateTime kLastDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  StartingDayOfWeek startingDayOfWeek =  StartingDayOfWeek.monday;

  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    print('initState');
    // TODO: implement initState
    super.initState();
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if(entriesList.isNotEmpty){
        //   overlayEntry?.remove();
        //   entriesList.remove(overlayEntry);
        // }
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              "日历",
            ),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: TableCalendar(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    headerVisible: false,
                    daysOfWeekVisible: true,
                    daysOfWeekHeight: 40,
                    rowHeight: 58,
                    startingDayOfWeek: startingDayOfWeek,
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

                      solar.getFestivals().isNotEmpty ? text = solar.getFestivals()[0] : text = text;
                      date.getJieQi().isNotEmpty ? text = date.getJieQi() : text = text;
                      date.getFestivals().isNotEmpty ? text = date.getFestivals()[0] : text = text;

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
                Container(
                  key: globalKey,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 1),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            RenderBox? renderBox = globalKey.currentContext?.findRenderObject() as RenderBox?;
                            final positionGreen = renderBox?.localToGlobal(Offset.zero);
                            showDialogPage(context, positionGreen!.dy + 4);
                          },
                          child: const Icon(Icons.more_vert_rounded))
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: 350.w,
                  height: 180.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/empty.png'),fit: BoxFit.fitHeight,height: 120.h,),
                      SizedBox(height: 5.h,),
                      Text(
                        '你还没有资产账户，点击下方按钮看看吧～',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 随机位置显示层
  void showDialogPage(BuildContext context, double dy) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (e) {
          return Stack(
            children: [
              const SizedBox(width: double.infinity, height: double.infinity),
              Positioned(
                // 指定位置
                left: 12,
                top: dy -30.h,
                child: Material(
                  child: Container(
                    width: 150.w,
                    height: 150.h,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.pop(context);
                            setState(() {
                              startingDayOfWeek = StartingDayOfWeek.friday;
                            });
                          },
                          title: Text(
                            '星期始于',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          tileColor: Colors.white,
                        ),
                        ListTile(
                            title: Text(
                              '农历',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            tileColor: Colors.white,
                            trailing: CupertinoSwitch(value: true, onChanged: (value) {})),
                        ListTile(
                            title: Text(
                              '日历样式',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            tileColor: Colors.white,
                            trailing: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
