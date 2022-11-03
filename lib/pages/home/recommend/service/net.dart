import 'package:wanandroid_flutter_swc/common/entities/banner.dart';
import 'package:wanandroid_flutter_swc/common/entities/recommend.dart';
import 'package:wanandroid_flutter_swc/http/HttpBase.dart';

abstract class IRecommendNet {
  Future getList(int pageNo, {int pageSize = 20});

  Future getBanner();
}

class RecommendNet extends HttpBase implements IRecommendNet {
  @override
  Future getList(int pageNo, {int pageSize = 20}) async {
    final response =
        await get("article/list/$pageNo/json", params: {'page_size': pageSize});
    final list = response['datas'];
    return List<Datas>.from(list.map((e) => Datas.fromJson(e)));
  }

  @override
  Future getBanner() async {
    final response = await get("banner/json");
    print("banner response $response");
    return List<BannerEntity>.from(
        response.map((e) => BannerEntity.fromJson(e)));
  }
}