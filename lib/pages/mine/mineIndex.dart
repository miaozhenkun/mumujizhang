import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MineIndex extends StatefulWidget {
  const MineIndex({Key? key}) : super(key: key);

  @override
  State<MineIndex> createState() => _MineIndexState();
}

class _MineIndexState extends State<MineIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomScrollView(
        physics:  ScrollPhysics(),
        // reverse: true,
        slivers: [
          ExtendedSliverAppbar(
            toolBarColor: Get.theme.appBarTheme.backgroundColor,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_sharp,
                  color: Get.theme.appBarTheme.backgroundColor,
                )),
            title: const CircleAvatar(
              backgroundImage: NetworkImage('https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800'),
            ),
            actions: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_sharp,
                  color: Colors.white,
                )),
            background: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Get.theme.appBarTheme.backgroundColor),
          constraints: BoxConstraints(
            minHeight: 200.h,
          ),
                  // height: 200.h,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.w, right: 10.w),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800'),
                          radius: 40.w,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('因为所以', style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w700)),
                          Text('坚持记账第3天', style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 16.w,
                    bottom: 16.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Icon(Icons.photo_camera_outlined,size: 16.w,color: Colors.white,),
                          Text('设置背景', style: TextStyle(fontSize: 12.sp, color: Colors.white))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 800.h,
                  color: Colors.deepPurpleAccent,
                ),
                Container(
                  height: 800.h,
                  color: Colors.red,
                ),
              ]),
          )
        ],
      ),
    );
  }
}
