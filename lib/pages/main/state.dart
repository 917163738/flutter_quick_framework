import 'package:get/get.dart';

class MainState {
  final _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(value) => _selectIndex.value = value;
}