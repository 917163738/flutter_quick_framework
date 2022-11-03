import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/pages/home/center/view.dart';
import 'package:wanandroid_flutter_swc/pages/home/qa/view.dart';
import 'package:wanandroid_flutter_swc/pages/home/recommend/view.dart';

import 'logic.dart';

class HomePage extends GetView<HomeLogic> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: controller.tabs
                  .map((title) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ))
                  .toList(),
              isScrollable: true,
            ),
          ),
          body: const TabBarView(
            children: [RecommendPage(), CenterPage(), QaPage()],
          ),
        ));
  }
}