import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/pages/home/center/widgets/item_view.dart';

import '../../../common/widgets/list.dart';
import 'logic.dart';

class CenterPage extends StatefulWidget {
  const CenterPage({Key? key}) : super(key: key);

  @override
  State<CenterPage> createState() => _CenterPageState();
}

class _CenterPageState extends State<CenterPage> {
  final logic = Get.find<CenterLogic>();

  @override
  Widget build(BuildContext context) {
    return listWithRefresherObx(
        logic,
        CustomScrollView(
          slivers: [
            Obx(() {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((content, index) {
                    return itemView(logic.state.list[index]);
                  }, childCount: logic.state.list.length));
            })
          ],
        ));
  }
}