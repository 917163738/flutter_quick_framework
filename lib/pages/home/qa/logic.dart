import 'package:wanandroid_flutter_swc/common/base/state_logic.dart';
import 'package:wanandroid_flutter_swc/pages/home/qa/service/repo.dart';

import 'state.dart';

class QaLogic extends StateLogic<Repo> {
  @override
  String? get tag => 'QaRepo';
  final QaState state = QaState();

  @override
  void onLoadData({bool isRefresh = false}) {
    futureWithDefaultRefresher(state.list, isRefresh);
  }
}