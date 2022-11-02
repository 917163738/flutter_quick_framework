import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/pages/category/view.dart';
import 'package:wanandroid_flutter_swc/pages/collect/view.dart';
import 'package:wanandroid_flutter_swc/pages/home/view.dart';
import 'package:wanandroid_flutter_swc/pages/mine/view.dart';

import 'logic.dart';

class MainPage extends GetView<MainLogic> {
  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    CollectPage(),
    MinePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChange,
        children: _pages,
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Obx _bottomBar() {
    return Obx(() {
      return BottomNavigationBar(
        items: controller.bottomList,
        currentIndex: controller.state.selectIndex,
        iconSize: 22,
        onTap: controller.onTabClick,
        type: BottomNavigationBarType.fixed,
      );
    });
  }
}