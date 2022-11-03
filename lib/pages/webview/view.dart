import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/widgets/app.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters['title'];
    return Scaffold(
      appBar: customAppBar(title!.isNotEmpty ? title : '网页浏览'),
      body: WebView(
        initialUrl: Get.parameters['url'],
      ),
    );
  }
}