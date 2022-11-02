import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_swc/common/base/state_logic.dart';

Widget listWithRefresherObx(StateLogic logic, Widget child,
    {bool enablePullUp = true, bool enablePullDown = true}) {
  return logic.obx(() => SmartRefresher(
      controller: logic.refresherController,
      onRefresh: () => logic.onLoadData(isRefresh: true),
      onLoading: logic.onLoadData,
      enablePullUp: enablePullUp,
      enablePullDown: enablePullDown,
      child: child));
}

Widget timeLine(bool isFirst, bool isLast) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      VerticalDivider(
        width: 0.5,
        thickness: 1,
        indent: isFirst ? 18 : 0,
        color: isLast ? Colors.transparent : const Color(0xffebeded),
      ),
      Container(
        width: 0.5,
        height: 18,
        color: !isFirst&&isLast ? const Color(0xffebeded) : Colors.transparent,
      ),
      Container(
        margin: const EdgeInsets.only(top: 18),
        child: ClipOval(
          child: Container(
            width: 9,
            height: 9,
            color: Colors.blue,
          ),
        ),
      ),
      // timeLine(isFirst, isLast),
    ],
  );
}
List<int> getDividersIndexes(List<dynamic> list) {
  List<int> dividersIndexes = [];
  for (var i = 0; i < (list.length * 2) - 1; i++) {
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      dividersIndexes.add(i);
    }
  }
  return dividersIndexes;
}