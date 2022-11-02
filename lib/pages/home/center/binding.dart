import 'package:get/get.dart';

import 'logic.dart';

class CenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CenterLogic());
  }
}
