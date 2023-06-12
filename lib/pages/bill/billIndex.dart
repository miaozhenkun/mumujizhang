import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../events/theme_event.dart';
import '../../getxController/theme_controller.dart';
import '../../themes/Themes.dart';

class BillIndex extends StatefulWidget {
  const BillIndex({Key? key}) : super(key: key);

  @override
  State<BillIndex> createState() => _BillIndexState();
}

class _BillIndexState extends State<BillIndex> {
  final ThemeController themeController = Get.put(ThemeController());

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
          ],
        ),
      ),
    );
  }
}