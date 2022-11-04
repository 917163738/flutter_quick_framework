import 'package:get/get.dart';

import 'logic.dart';
import 'service/net.dart';
import 'service/repo.dart';

class CenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CenterLogic());
    Get.lazyPut<INet>(() => Net(),tag: 'CenterNet');
    Get.lazyPut(() => Repo(Get.find(tag: 'CenterNet')),tag: 'CenterRepo');
  }
}