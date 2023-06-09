import 'package:get/get.dart';
import '../LoginPage.dart';
import '../main.dart';
import '../tabs/myHomePage.dart';

class GetRoutes {
  static const Tabs = '/tabs';
  static const Login = '/login';
  static const WebLogin = '/webLogin';
  static const Demo = '/Demo';
  static const Home = '/home';
  static const AdultVaccination = '/adultVaccination';
  static const VaccineList = '/VaccineList';
  static const ChildHome = '/ChildHome';
  static const GZXDropDownMenuTest = '/GZXDropDownMenuTest';

  static const Jzmz = '/JzmzPage';
  static const MzDetail = '/MzDetailPage';
  static const NoticeList = '/NoticeListPage';
  static const NoticeDetail = '/NoticeDetailPage';
  static const AdultList = '/AdultListPage';
  static const AppointmentRecordPage = '/AppointmentRecordPage';
  static const XgVaccRecord = '/XgVaccRecordPage';
  static const VaccDiaryCard = '/VaccDiaryCardPage';
  static const VaccEditDiary = '/VaccEditDiaryCard';
  static const Reservation = '/ReservationPage';
  static const AppointNotice = '/AppointNoticePage';
  static const SchoolChecking = '/SchoolCheckingPage';
  static const VaccReserve = '/VaccReservePage';
  static const Records = '/RecordsPage';

  static const Setting = '/setting';
  static const User = '/user';
  static const Czsc = '/czscPage';
  static const CzscDetail = '/CzscDetail';
  static const ChangeLan = '/changeLan';
  static const Linux = '/linux';
  static const List = '/list';
  static const Detail = '/detail';

  static const INITIAL = Tabs;

  static final routes = [
    GetPage(name: Login, page: () => LoginPage()),
    GetPage(name: Tabs, page: () => MyHomePage(), children: [
      GetPage(
        name: Home,
        children: [
          // GetPage(
          //   name: AdultVaccination,
          //   transition: Transition.cupertino,
          //   page: () => AdultVaccinationPage(),
          // ),
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
