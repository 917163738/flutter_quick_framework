
import 'package:wanandroid_flutter_swc/common/base/base_repo.dart';

import 'net.dart';

class CallUnCreatedRepo extends BaseRepo{
  final IRecommendNet _net;

  CallUnCreatedRepo(this._net);

  @override
  Future getList(int pageNo, {Map<String,dynamic>? dynamics}) async{
    return _net.getList(pageNo);
  }

  Future getBanner() async{
    return _net.getBanner();
  }
}