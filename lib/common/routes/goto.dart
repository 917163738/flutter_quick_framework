import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/names.dart';

void gotoWeb(String url, {String title = ''}) {
  Get.toNamed(AppRoutes.web, parameters: {'url': url, 'title': title});
}