import 'dart:convert';

import 'package:get/get.dart';
import 'package:wanandroid_flutter_swc/common/entities/user.dart';
import 'package:wanandroid_flutter_swc/common/services/services.dart';
import 'package:wanandroid_flutter_swc/common/values/values.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;

  // 令牌 token
  String token = '';

  // 用户 profile
  final profile = UserInfo().obs;

  bool get isLogin => _isLogin.value;

  UserInfo get profileValue => profile.value;

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      profile(UserInfo.fromJson(jsonDecode(profileOffline)));
    }
    if (token.isNotEmpty) {
      _isLogin.value = true;
    }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    token = value;
    StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
  }

  // 获取 profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
    // StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  }

  // 保存 profile
  Future<void> saveProfile(UserInfo profile) async {
    _isLogin.value = true;
    this.profile.value = profile;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  }

  // 注销
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    _isLogin.value = false;
    token = '';
  }
}