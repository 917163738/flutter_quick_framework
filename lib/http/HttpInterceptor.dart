import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroid_flutter_swc/common/store/store.dart';

import '../common/widgets/widgets.dart';
import 'HttpException.dart';

// 自定义拦截器
class HttpInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    String token = UserStore.to.token;
    if (token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }
    if (options.data == null) {
      options.contentType = null;
    }
    if (options.path.startsWith('http')) {
      options.baseUrl = '';
    }

    debugPrint("\n ---------Start Http Request---------");
    debugPrint("Request_Url:${options.baseUrl}${options.path}");
    debugPrint("Request_Method:${options.method}");
    debugPrint("Request_Headers:${options.headers}");
    debugPrint("Request_Data:${options.data}");
    debugPrint("Request_QueryParameters:${options.queryParameters}");
    debugPrint("---------End Http Request---------");
    super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    debugPrint("response.data：${response.data}");
    if (!response.headers.toString().contains('json')) {
      Map<String, dynamic> responseData = jsonDecode(response.data);
      response.data = responseData;
    }
    debugPrint("---------Start Http Response---------");
    debugPrint(
        "Response_Url:${response.requestOptions.baseUrl}${response.requestOptions.path}");
    debugPrint("Response_StatusCode:${response.statusCode}");
    debugPrint("Response_StatusMessage:${response.statusMessage}");
    debugPrint("Response_Headers:${response.headers.toString()}");
    debugPrint("Response_Data:${response.data.toString()}");
    debugPrint("---------End Http Response---------");
    if (response.data is Map) {
      Map<String, dynamic> data = response.data;
      if (data.containsKey('errorCode') && data.containsKey('errorMsg')) {
        if (data['errorCode'] != 0) {
          // HttpException httpException = HttpException(
          //   code: data['code'],
          //   msg: data['message'],
          // );
          handler.reject(
              DioError(
                  requestOptions: response.requestOptions, response: response),
              true);
          return;
          // throw httpException;
        } else {
          if (data.containsKey('value')) {
            response.data = data['value'];
          }
        }
      }
    }
    super.onResponse(response, handler);
    // }
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    // error统一处理
    HttpError httpException = HttpError.create(err);
    // 错误提示
    debugPrint('DioError===: ${httpException.toString()}');
    err.error = httpException;
    toastInfo(msg: httpException.msg);
    super.onError(err, handler);
  }
}