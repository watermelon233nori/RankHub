import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String _token = '';
  final _userProfile = <String, dynamic>{}.obs;

  bool get isLogin => _isLogin.value;
  String get token => _token;
  Map<String, dynamic> get userProfile => _userProfile;

  static const String _storageTokenKey = 'rankhub_user_token';
  // 暂时不需要存储完整的 user profile，如果需要可以序列化为 JSON 字符串存储

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_storageTokenKey) ?? '';
    if (_token.isNotEmpty) {
      _isLogin.value = true;
    }
  }

  Future<void> saveToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storageTokenKey, value);
    _token = value;
    _isLogin.value = true;
  }

  Future<void> saveProfile(Map<String, dynamic> profile) async {
    _userProfile.value = profile;
    // TODO: Persist profile if needed
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageTokenKey);
    _token = '';
    _userProfile.clear();
    _isLogin.value = false;
  }
}
