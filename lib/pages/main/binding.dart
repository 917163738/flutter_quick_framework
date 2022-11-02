import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/pages/category/binding.dart';
import 'package:wanandroid_flutter_swc/pages/collect/binding.dart';
import 'package:wanandroid_flutter_swc/pages/home/binding.dart';
import 'package:wanandroid_flutter_swc/pages/mine/binding.dart';

import 'logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    HomeBinding().dependencies();
    CategoryBinding().dependencies();
    CollectBinding().dependencies();
    MineBinding().dependencies();
  }
}