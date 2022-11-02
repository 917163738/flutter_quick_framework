import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/routes/names.dart';
import 'package:wanandroid_flutter_swc/common/store/store.dart';

// 自定义 http 异常
class HttpError implements Exception {
  final int code;
  final String msg;

  HttpError({this.code = 500, this.msg = '未知异常，请联系管理员'});

  @override
  String toString() {
    return "HttpError [$code]: $msg";
  }

  factory HttpError.create(DioError error) {
    // dio 异常
    switch (error.type) {
      case DioErrorType.cancel:
        return HttpError(code: -1, msg: '请求取消');
      case DioErrorType.connectTimeout:
        return HttpError(code: -1, msg: '连接超时');
      case DioErrorType.sendTimeout:
        return HttpError(code: -1, msg: '请求超时');
      case DioErrorType.receiveTimeout:
        return HttpError(code: -1, msg: '响应超时');
      case DioErrorType.response:
        // 服务器异常

        int? statusCode = error.response?.statusCode;
        String msg = '';
        if (error.response?.data is String) {
          Map<String, dynamic> responseData = jsonDecode(error.response?.data);
          error.response?.data = responseData;
        }
        if (error.response != null && error.response!.statusMessage != null) {
          msg = error.response!.statusMessage!;
        }
        if (msg.isEmpty) {
          if (error.response?.data.containsKey('errorMsg')) {
            msg = error.response!.data['errorMsg'];
          }
        }
        switch (statusCode) {
          case 400:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '请求语法错误');
          case 401: //登录失效
            _logoutToLogin();
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '没有权限');
          case 403:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '服务器拒绝执行');
          case 404:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '无法连接服务器');
          case 500:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '服务器内部错误');
          case 502:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '无效的请求');
          case 503:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '服务器挂了');
          case 505:
            return HttpError(
                code: statusCode!, msg: msg.isNotEmpty ? msg : '不支持HTTP协议请求');
          default:
            return HttpError(
              code: statusCode ?? 500,
              msg: msg.isNotEmpty ? msg : '未知异常，请联系管理员',
            );
        }
      default:
        if (error.response?.data.containsKey('errorCode') &&
            error.response?.data.containsKey('errorMsg')) {
          final errorCode = error.response!.data['errorCode'];
          if (errorCode.toString() == '1001') {
            //登录失效
            _logoutToLogin();
          }
          return HttpError(
              code: errorCode, msg: error.response!.data['errorMsg']);
        }
        return HttpError(code: 500, msg: error.message);
    }
  }
}

void _logoutToLogin() {
  UserStore.to.onLogout();
  // Get.offAllNamed(AppRoutes.SIGN_IN);
}