import 'package:get/get.dart';

class WelcomeState {
  final _currentTime = 2.obs;
  set currentTime(value) => _currentTime.value = value;
  get currentTime => _currentTime.value;
}