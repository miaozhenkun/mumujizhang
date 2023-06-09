import 'package:flutter/material.dart';

class CalendarIndex extends StatefulWidget {
  const CalendarIndex({Key? key}) : super(key: key);

  @override
  State<CalendarIndex> createState() => _CalendarIndexState();
}

class _CalendarIndexState extends State<CalendarIndex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text(
            "日历",
          ),
          centerTitle: true
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}