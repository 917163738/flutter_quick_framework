import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class QaPage extends StatefulWidget {
  const QaPage({Key? key}) : super(key: key);

  @override
  State<QaPage> createState() => _QaPageState();
}

class _QaPageState extends State<QaPage> {
  final logic = Get.find<QaLogic>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}