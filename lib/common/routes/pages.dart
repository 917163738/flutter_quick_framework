import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/middlewares/middlewares.dart';
import 'package:wanandroid_flutter_swc/pages/main/binding.dart';
import 'package:wanandroid_flutter_swc/pages/main/view.dart';
import 'package:wanandroid_flutter_swc/pages/welcome/index.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.main,
      page: () =>  MainPage(),
      binding: MainBinding(),
    ),
  ];

// static final unknownRoute = GetPage(
//   name: AppRoutes.NotFound,
//   page: () => NotfoundView(),
// );

}