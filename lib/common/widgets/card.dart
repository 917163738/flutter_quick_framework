import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget itemCardView({required Widget child}) {
  return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      // 外边距
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        padding:
        EdgeInsets.only(top: 15.h, bottom: 12.h, left: 15.w, right: 15.w),
        child: child,
      ));
}