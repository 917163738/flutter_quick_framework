import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/names.dart';
import 'package:wanandroid_flutter_swc/common/store/user.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    // if (UserStore.to.isLogin ||
    //     route == AppRoutes.SIGN_IN ||
    //     route == AppRoutes.INITIAL) {
      return null;
    // } else {
    //   Future.delayed(
    //       const Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
    //   return const RouteSettings(name: AppRoutes.SIGN_IN);
    // }
  }
}