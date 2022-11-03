import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../values/values.dart';

/// 透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

/// 透明背景 AppBar
AppBar customAppBar(String title, {bool showBack = true,List<Widget>? actions}) {
  return AppBar(
      leading: showBack
          ? InkWell(
              onTap: () => {Get.back()},
              child: Container(
                  padding: EdgeInsets.all(15.w),
                  child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
            )
          : null,
      toolbarHeight: 48.h,
      leadingWidth: 48.w,
      backgroundColor: Colors.blue,
      elevation: 0,
      actions: actions,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.sp),
      title: Text(
        title,
      ));
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 10.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}