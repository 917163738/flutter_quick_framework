import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/values/values.dart';

import 'state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  final Map<IconData, String> _bottomNames = {
    Icons.home: '首页',
    Icons.category: '分类',
    Icons.favorite: '收藏',
    Icons.person: '我的'
  };
  late final PageController pageController;
  final List<BottomNavigationBarItem> bottomList = [];

  onTabClick(int value) {
    pageController.jumpToPage(value);
    // state.selectIndex = value;
  }

  onPageChange(int value) {
    state.selectIndex = value;
  }

  @override
  void onInit() {
    super.onInit();
    _bottomNames.forEach((key, value) {
      bottomList.add(_bottomItem(key, value));
    });
    pageController = PageController(initialPage: state.selectIndex);
    // _startSip();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  BottomNavigationBarItem _bottomItem(IconData key, String title) {
    return BottomNavigationBarItem(
        icon: Icon(
          key,
          color: AppColors.navUnSelected,
        ),
        activeIcon: Icon(
          key,
          color: Colors.blue,
        ),
        label: title);
  }
}