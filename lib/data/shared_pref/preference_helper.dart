

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _isLikedKey = 'is_liked';

  SharedPreferencesHelper._privateConstructor();


  static final SharedPreferencesHelper instance =
  SharedPreferencesHelper._privateConstructor();

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> getIsLiked() async {
    final prefs = await _getSharedPreferences();
    return prefs.getBool(_isLikedKey) ?? false;
  }

  Future<void> setIsLiked(bool isLiked) async {
    final prefs = await _getSharedPreferences();
    await prefs.setBool(_isLikedKey, isLiked);
  }
}