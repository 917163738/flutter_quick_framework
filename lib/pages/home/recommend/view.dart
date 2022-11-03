import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/goto.dart';
import 'package:wanandroid_flutter_swc/common/widgets/banner_view.dart';
import 'package:wanandroid_flutter_swc/common/widgets/list.dart';

import 'logic.dart';
import 'widgets/item_view.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.find<RecommendLogic>();

  @override
  Widget build(BuildContext context) {
    return listWithRefresherObx(
        logic,
        CustomScrollView(
          slivers: [
            Obx(() {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((content, index) {
                if (index == 0) {
                  return buildBanner();
                }
                return itemView(logic.state.list[index - 1]);
              }, childCount: logic.state.list.length + 1));
            })
          ],
        ));
  }

  Obx buildBanner() {
    return Obx(() {
      return Visibility(
        visible: logic.state.bannerList.isNotEmpty,
        child: SizedBox(
          height: 180,
          child: BannerView(
            children: logic.state.bannerList
                .map((element) => InkWell(
                      onTap: () =>
                          {gotoWeb(element.url!, title: element.title ?? '')},
                      child: Image.network(element.imagePath ?? '',
                          fit: BoxFit.cover),
                    ))
                .toList(),
          ),
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}