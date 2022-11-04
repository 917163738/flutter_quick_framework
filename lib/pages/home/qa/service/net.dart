import 'package:wanandroid_flutter_swc/common/entities/recommend.dart';
import 'package:wanandroid_flutter_swc/http/HttpBase.dart';

abstract class INet {
  Future getList(int pageNo, {int pageSize = 20});

}

class Net extends HttpBase implements INet {
  @override
  Future getList(int pageNo, {int pageSize = 20}) async {
    final response =
        await get("wenda/list/${pageNo+1}/json", params: {'page_size': pageSize});
    final list = response['datas'];
    return List<Datas>.from(list.map((e) => Datas.fromJson(e)));
  }
}