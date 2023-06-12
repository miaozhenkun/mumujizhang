import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyIndex extends StatefulWidget {
  const PropertyIndex({Key? key}) : super(key: key);

  @override
  State<PropertyIndex> createState() => _PropertyIndexState();
}

class _PropertyIndexState extends State<PropertyIndex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text(
            "资产管理",
          ),
          centerTitle: true
      ),
      body:  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/cash_bg.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}