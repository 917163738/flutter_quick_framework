import 'package:wanandroid_flutter_swc/common/entities/banner.dart';
import 'package:wanandroid_flutter_swc/http/HttpBase.dart';

abstract class IRecommendNet {
  Future getList(int pageNo, {int pageSize = 20});

  Future getBanner();
}

class RecommendNet extends HttpBase implements IRecommendNet {
  @override
  Future getList(int pageNo, {int pageSize = 20}) async {}

  @override
  Future getBanner() async {
    final response = await get("banner/json");
    print("banner response $response");
    return List<BannerEntity>.from(
        response.map((e) => BannerEntity.fromJson(e)));
  }
}