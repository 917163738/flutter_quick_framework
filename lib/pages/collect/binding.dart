import 'package:get/get.dart';

import 'logic.dart';

class CollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectLogic());
  }
}
