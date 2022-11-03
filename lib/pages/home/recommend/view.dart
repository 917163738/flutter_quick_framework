import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/goto.dart';
import 'package:wanandroid_flutter_swc/common/widgets/banner_view.dart';

import 'logic.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  final _logic = Get.find<RecommendLogic>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Visibility(
            visible: _logic.state.bannerList.isNotEmpty,
            child: SizedBox(
              height: 180,
              child: BannerView(
                children: _logic.state.bannerList
                    .map((element) => InkWell(
                          onTap: () => {
                            gotoWeb(element.url!, title: element.title ?? '')
                          },
                          child: Image.network(element.imagePath ?? '',
                              fit: BoxFit.cover),
                        ))
                    .toList(),
              ),
            ),
          );
        })
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}