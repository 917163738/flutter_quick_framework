import 'package:get/get.dart';

import 'logic.dart';
import 'service/net.dart';
import 'service/repo.dart';

class QaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QaLogic());
    Get.lazyPut<INet>(() => Net(),tag: 'QaNet');
    Get.lazyPut(() => Repo(Get.find(tag: 'QaNet')),tag: 'QaRepo');
  }
}