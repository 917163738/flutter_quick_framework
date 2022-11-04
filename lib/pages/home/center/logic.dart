import 'package:wanandroid_flutter_swc/common/base/state_logic.dart';

import 'service/repo.dart';
import 'state.dart';

class CenterLogic extends StateLogic<Repo> {
  @override
  String? get tag => 'CenterRepo';
  final CenterState state = CenterState();

  @override
  void onLoadData({bool isRefresh = false}) {
    futureWithDefaultRefresher(state.list, isRefresh);
  }
}