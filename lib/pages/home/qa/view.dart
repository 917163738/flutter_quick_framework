import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/widgets/list.dart';
import 'package:wanandroid_flutter_swc/pages/home/qa/widgets/item_view.dart';

import 'logic.dart';

class QaPage extends StatefulWidget {
  const QaPage({Key? key}) : super(key: key);

  @override
  State<QaPage> createState() => _QaPageState();
}

class _QaPageState extends State<QaPage> {
  final logic = Get.find<QaLogic>();

  //smartrefresher必须嵌套继承于ScrollView的那一类组件,目前来说,就只有这三种,ListView,GridView,CustomScrollView
  // @override
  // Widget build(BuildContext context) {
  //   return listWithRefresherObx(
  //       logic,
  //       ListView.builder(
  //           itemBuilder: (context, index) => itemView(logic.state.list[index]),
  //           itemCount: logic.state.list.length,
  //         )
  //    );
  // }

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