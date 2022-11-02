import 'dart:async';

import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/names.dart';
import 'package:wanandroid_flutter_swc/common/store/store.dart';

import 'index.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  Timer? _timer;

  WelcomeController();

  void _timerTick(){
    _timer=Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      state.currentTime--;
      if (state.currentTime <= 0) {
        handleNavSignIn();
      }
    });
  }

  // 跳转 注册界面
  handleNavSignIn() {
    // await ConfigStore.to.saveAlreadyOpen();
    _timer?.cancel();
    // if(UserStore.to.isLogin){
      Get.offAndToNamed(AppRoutes.main);
    // }else{
    //   Get.offAndToNamed(AppRoutes.SIGN_IN);
    // }
  }


  @override
  void onReady() {
    super.onReady();
    _timerTick();
  }
}