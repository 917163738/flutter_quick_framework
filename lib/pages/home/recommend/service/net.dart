import 'package:date_format/date_format.dart';
import 'package:wanandroid_flutter_swc/http/HttpBase.dart';

abstract class IRecommendNet {
  Future getList(int pageNo, {int pageSize = 20});
  Future getBanner();
}

class RecommendNet extends HttpBase implements IRecommendNet {
  @override
  Future getList(int pageNo, {int pageSize = 20}) async {
  }

  @override
  Future getBanner() {
    // TODO: implement getBanner
    throw UnimplementedError();
  }
}