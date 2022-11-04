
import 'package:wanandroid_flutter_swc/common/base/base_repo.dart';

import 'net.dart';

class Repo extends BaseRepo{
  final INet _net;

 Repo(this._net);

  @override
  Future getList(int pageNo, {Map<String,dynamic>? dynamics}) async{
    return _net.getList(pageNo);
  }
}