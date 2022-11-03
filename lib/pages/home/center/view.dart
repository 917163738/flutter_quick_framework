import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Container();
  }
}