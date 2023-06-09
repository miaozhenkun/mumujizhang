import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../pages/bill/billIndex.dart';
import '../pages/calendar/calendarIndex.dart';
import '../pages/mine/mineIndex.dart';
import '../pages/property/propertyIndex.dart';
import '../themes/Themes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0,
  );

  List<Widget> _buildScreens() {
    return [const BillIndex(), const CalendarIndex(), const PropertyIndex(), const MineIndex()];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: _buildScreens(),
        ),
        bottomNavigationBar: SizedBox(
          height: 56.h,
          child: BottomAppBar(
            padding: EdgeInsets.zero,
            color: Get.theme.appBarTheme.backgroundColor,
            // shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildBottomNavigationItem('assets/images/home.png', '账单', 0),
                buildBottomNavigationItem('assets/images/calendar.png', '日历', 1),
                buildBottomNavigationAccountItem(),
                buildBottomNavigationItem('assets/images/account.png', '资产', 2),
                buildBottomNavigationItem('assets/images/user.png', '我的', 3),
              ],
            ),
          ),
        )
    );
  }

  Widget buildBottomNavigationItem(String imgUrl, String menuName, int index) {
    return GestureDetector(
      child: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgUrl, width: 24, height: 24, color: index == _currentIndex ? Colors.black : Colors.black38),
            Text(
              menuName.toString(),
              style: TextStyle(fontSize: 14.sp, color: index == _currentIndex ? Colors.black : Colors.black54),
            ),
          ],
        ),
        // color: Colors.white,
      ),
      onTap: () {
        goPage(index);
      },
    );
  }

  Widget buildBottomNavigationAccountItem() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 44.w,
        height: 30.h,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
          color: Colors.white,
        ),
        // color: Colors.white,
      ),
      onTap: () {
        // goPage(0);
      },
    );
  }

  goPage(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
