import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/base/state_logic.dart';

import 'service/repo.dart';
import 'state.dart';

class RecommendLogic extends StateLogic<RecommendRepo> {
  final RecommendState state = RecommendState();

  @override
  void onInit() {
    super.onInit();
    getBanner();
  }

  Future getBanner() async{
   final result= await repo.getBanner();
   state.bannerList.addAll(result);
  }

  @override
  void onLoadData({bool isRefresh = false}) {
  }

}