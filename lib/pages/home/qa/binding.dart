import 'package:get/get.dart';

import 'logic.dart';

class QaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QaLogic());
  }
}
