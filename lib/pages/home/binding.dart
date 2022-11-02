import 'package:get/get.dart';

import 'center/binding.dart';
import 'logic.dart';
import 'qa/binding.dart';
import 'recommend/binding.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    RecommendBinding().dependencies();
    CenterBinding().dependencies();
    QaBinding().dependencies();
  }
}