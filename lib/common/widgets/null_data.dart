import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget dataStatusWidget(RefreshNotifier<RefreshStatus>? headerStatus) {
  switch (headerStatus?.value) {
    case RefreshStatus.completed:
      {
        return nullDataWidget();
      }
    case RefreshStatus.failed:
      {
        return errorDataWidget();
      }
    case RefreshStatus.refreshing:
      {
        return nullDataWidget(isLoading: true);
      }
    default:
      {
        return const SizedBox(
          width: 0,
          height: 0,
        );
      }
  }
}

Widget nullDataWidget({bool isLoading = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 60),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          'assets/images/pic_data_no.png',
          width: 150.w,
          height: 150.h,
        ),
        Text(isLoading ? '正在加载中...' : '这里空空如也'),
      ],
    ),
  );
}

Widget errorDataWidget({String? msg}) {
  return Container(
    margin: const EdgeInsets.only(top: 60),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          'assets/images/pic_data_fail.png',
          width: 150.w,
          height: 150.h,
        ),
        Text('${msg ?? '数据加载异常'}，请下拉重新刷新～'),
      ],
    ),
  );
}

SmartRefresher dataStatusWithRefresher(RefreshController refreshController,
    {VoidCallback? onRefresh, bool isError = false, String? errorMsg}) {
  if (errorMsg != null) {
    isError = true;
  }
  return SmartRefresher(
    controller: refreshController,
    enablePullUp: true,
    onRefresh: onRefresh,
    child: ListView.builder(
      itemBuilder: (_, index) =>
          isError ? errorDataWidget(msg: errorMsg) : nullDataWidget(),
      itemCount: 1,
    ),
  );
}