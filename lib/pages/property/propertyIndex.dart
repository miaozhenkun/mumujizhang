import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PropertyIndex extends StatefulWidget {
  const PropertyIndex({Key? key}) : super(key: key);

  @override
  State<PropertyIndex> createState() => _PropertyIndexState();
}

class _PropertyIndexState extends State<PropertyIndex> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "资产管理",
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 600.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                width: 350.w,
                height: 100.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(image: AssetImage('assets/images/cash_bg.jpg'), fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '净资产',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white60),
                    ),
                    Text(
                      '0.00',
                      style: TextStyle(fontSize: 22.sp, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          '总资产',
                          style: TextStyle(fontSize: 12.sp, color: Colors.white60),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '｜',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white60),
                        ),
                        Text(
                          '总资产',
                          style: TextStyle(fontSize: 12.sp, color: Colors.white60),
                        ),
                        Text(
                          '0.00',
                          style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 350.w,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 165.w,
                        height: 60.h,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white)
                    ),
                    Container(
                        width: 165.w,
                        height: 60.h,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white)),
                  ],
                ),
              ),

              Container(
                  width: 350.w,
                  height: 220.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/images/empty.png'),fit: BoxFit.fitHeight,height: 120.h,),
                    SizedBox(height: 5.h,),
                    Text(
                      '你还没有资产账户，点击下方按钮看看吧～',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    SizedBox(height: 10.h,),
                    ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Get.theme.appBarTheme.backgroundColor),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40.w)),
                    ), onPressed: (){}, child: Text('添加资金账户',style: TextStyle(color: Colors.white,fontSize: 14.sp),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
