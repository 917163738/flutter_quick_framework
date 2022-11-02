import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/store/store.dart';
import 'package:wanandroid_flutter_swc/http/HttpConfig.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = HttpConfig.BASE_URL;
    httpClient.addRequestModifier<void>((options) {
      String token = UserStore.to.token;
      options.headers['Authorization'] = token;
      return options;
    });

    httpClient.addResponseModifier((request, response){
      // if (!response.headers.toString().contains('json')) {
      //   Map<String, dynamic> responseData = jsonDecode(response.bodyString??'');
      //   response.data = responseData;
      // }
      debugPrint("---------Start Http Response---------");
      debugPrint(
          "Response_Url:${response.request?.url.toString()}");
      debugPrint("Response_StatusCode:${response.statusCode}");
      debugPrint("Response_statusText:${response.statusText}");
      debugPrint("Response_Headers:${response.headers.toString()}");
      debugPrint("Response_bodyString:${response.bodyString.toString()}");
      debugPrint("---------End Http Response---------");
      return response;
    });
    super.onInit();
  }
}