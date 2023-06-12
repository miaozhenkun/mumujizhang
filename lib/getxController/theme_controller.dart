import 'package:get/get.dart';

class ThemeController extends GetxController{

  // 未读消息数
  var isDarkUiMode = false.obs;

  setIsDarkUiMode(bool uiMode){
    isDarkUiMode = RxBool(uiMode);
    update();
  }

}