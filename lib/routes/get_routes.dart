import 'package:get/get.dart';
import '../LoginPage.dart';
import '../main.dart';
import '../pages/mine/setting.dart';
import '../tabs/myHomePage.dart';

class GetRoutes {
  static const Tabs = '/tabs';

  static const INITIAL = Tabs;

  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: Tabs, page: () => const MyHomePage(), children: [
      GetPage(
        name: '/home',
        children: [
          GetPage(
            name: '/settingIndex',
            transition: Transition.cupertino,
            page: () => const Setting(),
            children: [
              GetPage(
                  name: '/userInfo',
                  transition: Transition.cupertino,
                  page: () => const Setting(),
              ),
            ]
          ),
          // GetPage(
          //   name: VaccineList,
          //   page: () => VaccineListPage(),
          // ),
          // GetPage(
          //   name: ChildHome,
          //   page: () => ChildHomePage(),
          // ),
          // GetPage(
          //   name: Jzmz,
          //   page: () => JzmzPage(),
          // ),
          // GetPage(
          //   name: MzDetail,
          //   page: () => MzDetailPage(),
          // ),
          // GetPage(
          //   name: NoticeList,
          //   page: () => NoticeListPage(),
          // ),
          // GetPage(
          //   name: NoticeDetail,
          //   page: () => NoticeDetailPage(),
          // ),
          // GetPage(
          //   name: AdultList,
          //   page: () => AdultListPage(),
          // ),
          // GetPage(
          //   name: AppointmentRecordPage,
          //   page: () => AppointmentRecord(),
          // ),
          // GetPage(
          //   name: XgVaccRecord,
          //   page: () => XgVaccRecordPage(),
          // ),
          // GetPage(
          //   name: VaccDiaryCard,
          //   page: () => VaccDiaryCardPage(),
          // ),
          // GetPage(
          //   name: VaccEditDiary,
          //   page: () => VaccEditDiaryPage(),
          // ),
          // GetPage(
          //   name: GZXDropDownMenuTest,
          //   page: () => GZXDropDownMenuTestPage(),
          // ),
          // GetPage(
          //   name: Reservation,
          //   page: () => ReservationPage(),
          // ),
          // GetPage(
          //   name: AppointNotice,
          //   page: () => AppointNoticePage(),
          // ),
          // GetPage(
          //   name: SchoolChecking,
          //   page: () => SchoolCheckingPage(),
          // ),
          // GetPage(
          //   name: VaccReserve,
          //   page: () => VaccReservePage(),
          // ),
          // GetPage(
          //   name: Records,
          //   page: () => RecordsPage(),
          // )
        ],
        page: () => const MyHomePage(),
      ),
    ]),
  ];
}
