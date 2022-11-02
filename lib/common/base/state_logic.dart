import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_swc/common/base/state.dart';

import '../../http/HttpException.dart';
import '../widgets/null_data.dart';
import 'base_repo.dart';

extension _Ext on Object? {
  int _size() {
    final val = this;
    var result = 0;
    if (val is Iterable) {
      return val.length;
    }
    return result;
  }

  bool _isEmptyOrNull() {
    final val = this;
    // if (val == null) return true;
    var result = false;
    if (val == null) {
      return true;
    }
    if (val is Iterable) {
      result = val.isEmpty;
    } else if (val is String) {
      result = val.trim().isEmpty;
    } else if (val is Map) {
      result = val.isEmpty;
    }
    return result;
  }
}

abstract class StateLogic<T extends BaseRepo> extends GetxController
    with MixinState {
  final RefreshController refresherController = RefreshController();
  final String? tag = null;
  bool _needLoadDataWhenReady = true;
  var _pageNo = 1;

  T get repo => GetInstance().find<T>(tag: tag);

  void onLoadData({bool isRefresh = false});

  set needLoadDataWhenReady(value) => _needLoadDataWhenReady = value;

  @override
  void onReady() {
    if (_needLoadDataWhenReady) {
      onLoadData(isRefresh: true);
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    refresherController.dispose();
  }

  Widget obx(
    BuilderNotifier widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return onLoading ?? const Center(child: CircularProgressIndicator());
      } else if (status.isError) {
        return onError != null
            ? onError(status.errorMessage)
            : dataStatusWithRefresher(refresherController,
                isError: true,
                errorMsg: status.errorMessage,
                onRefresh: () => onLoadData(isRefresh: true));
      } else if (status.isEmpty) {
        return onEmpty ?? dataStatusWithRefresher(refresherController,
                onRefresh: () => onLoadData(
                    isRefresh: true)); // Also can be widget(null); but is risky
      }
      return widget();
    });
  }

  Future futureWithRefresher(Future future, List<dynamic>? list, bool isRefresh,
      {int pageLength = 20}) {
    if (isRefresh) {
      change(RxStatus.loading());
    }
    return future
        .then((newValue) => {
              isRefresh
                  ? refresherController.refreshCompleted()
                  : refresherController.loadComplete(),
              newValue as Object?,
              if (newValue._isEmptyOrNull()) {refresherController.loadNoData()},
              if ((newValue is Iterable) && newValue._size() < pageLength)
                {refresherController.loadNoData()},
              if (newValue._isEmptyOrNull() && (list == null || list.isEmpty))
                {change(RxStatus.empty())}
              else
                {change(RxStatus.success())}
            })
        .catchError((error) => {
              isRefresh
                  ? refresherController.refreshFailed()
                  : refresherController.loadFailed(),
              if (isRefresh && (list == null || list.isEmpty))
                {
                  if (error is DioError)
                    {change(RxStatus.error((error.error as HttpError).msg))}
                  else
                    {change(RxStatus.error(error.toString()))}
                }
            });
  }

  Future futureWithDefaultRefresher(List<dynamic>? list, bool isRefresh,
      {int pageLength = 20, Map<String,dynamic>? params}) {
    if (isRefresh) {
      change(RxStatus.loading());
    }
    return _getList(isRefresh, list, params)
        .then((newValue) => {
              isRefresh
                  ? refresherController.refreshCompleted()
                  : refresherController.loadComplete(),
              if (newValue._isEmptyOrNull()) {refresherController.loadNoData()},
              if ((newValue is Iterable) && newValue._size() < pageLength)
                {refresherController.loadNoData()},
              if (newValue._isEmptyOrNull() && (list == null || list.isEmpty))
                {change(RxStatus.empty())}
              else
                {change(RxStatus.success())}
            })
        .catchError((error) => {
              isRefresh
                  ? refresherController.refreshFailed()
                  : refresherController.loadFailed(),
              if (isRefresh && (list == null || list.isEmpty))
                {
                  if (error is DioError)
                    {change(RxStatus.error((error.error as HttpError).msg))}
                  else
                    {change(RxStatus.error(error.toString()))}
                }
            });
  }

  Future<List<dynamic>?> _getList(
      bool isRefresh, List<dynamic>? list, Map<String,dynamic>? params) async {
    if (isRefresh) {
      _pageNo = 1;
      refresherController.resetNoData();
    }
    final result = await repo.getList(_pageNo, dynamics: params);
    if (isRefresh) {
      list?.clear();
    }
    list?.addAll(result);
    _pageNo++;
    return result;
  }
}