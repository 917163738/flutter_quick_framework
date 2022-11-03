import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/pages/home/recommend/service/repo.dart';

import 'logic.dart';
import 'service/net.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut<IRecommendNet>(() => RecommendNet());
    Get.lazyPut(() => RecommendRepo(Get.find()));
  }
}