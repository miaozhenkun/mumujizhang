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
  List menus = [
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '账本管理',
    },
    {
      'imgUrl': 'assets/filled/tingche.webp',
      'menuName': '分类管理',
    },
    {
      'imgUrl': 'assets/filled/baoxiao.webp',
      'menuName': '报销',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '预算管理',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '借款管理',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '周期记账',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '纪念日',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '存钱计划',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '记账设置',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '成员管理',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '标签管理',
    },
    {
      'imgUrl': 'assets/images/account.png',
      'menuName': '帮助反馈',
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          top: false,
      child : CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ExtendedSliverAppbar(
            toolBarColor: Get.theme.appBarTheme.backgroundColor,
            leading: GestureDetector(
                child: Icon(
              Icons.settings_sharp,
              color: Get.theme.appBarTheme.backgroundColor,
            )),
            title: const CircleAvatar(
              backgroundImage: NetworkImage('https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800'),
            ),
            actions: IconButton(
                onPressed: () {
                  print('onPressed');
                  // Get.to(Setting());
                  Get.toNamed('/tabs/home/settingIndex')?.then((value) {
                    setState(() {});
                  });
                },
                icon: const Icon(
                  Icons.settings_sharp,
                  color: Colors.white,
                )),
            background: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Get.theme.appBarTheme.backgroundColor),
                  height: 168.h,
                  // height: 200.h,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.w, right: 10.w),
                        child: CircleAvatar(
                          backgroundImage:
                              const NetworkImage('https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800'),
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

          SliverFixedExtentList(
            delegate: SliverChildListDelegate([
              Container(
                height: 600.h,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                decoration: const BoxDecoration(
                    color: Color(0xfff3f3f3), borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 172.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getMenus(0, () {}),
                                getMenus(1, () {}),
                                getMenus(2, () {}),
                                getMenus(3, () {}),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getMenus(4, () {}),
                                getMenus(5, () {}),
                                getMenus(6, () {}),
                                getMenus(7, () {}),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                getMenus(8, () {}),
                                getMenus(9, () {}),
                                getMenus(10, () {}),
                                getMenus(11, () {}),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '  数据',
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                    ),
                    getDataItem(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '  其他',
                      style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                    ),
                    getOtherItem(),
                  ],
                ),
              ),
            ]), itemExtent: 600.h,
          )
        ],
      ),
    );
  }

  Widget getMenus(int index, Function onTap) {
    return Column(
      children: [
        Image(
          image: AssetImage(menus[index]['imgUrl']),
          width: 36.w,
        ),
        Text(
          menus[index]['menuName'].toString(),
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
        )
      ],
    );
  }

  Widget getDataItem() {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/account.png'),
                    width: 32.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '备份&恢复',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ],
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            color: Color(0xfff3f3f3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/account.png'),
                    width: 32.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '账单导入导出',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }

  Widget getOtherItem() {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: const AssetImage('assets/images/account.png'),
                    width: 32.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '分享给好友',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ],
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            color: Color(0xfff3f3f3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: const AssetImage('assets/images/account.png'),
                    width: 32.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '联系我们',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          ),
          Container(
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            color: Color(0xfff3f3f3),
          ),
          GestureDetector(
            onTap: () {
              print('关于');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/account.png'),
                      width: 32.w,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '关于',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
