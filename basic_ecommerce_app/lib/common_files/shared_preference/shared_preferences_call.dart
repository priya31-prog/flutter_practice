// import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

//single ton shared preferences
class CacheData {
  CacheData._internal();

  static final CacheData _instance = CacheData._internal();

  static CacheData get instance => _instance;

  SharedPreferences? pref;

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setUserLoggedIn(String key, bool value) async {
    await pref?.setBool('isUserLoggedIn', value);
  }

  bool? getUserLoggedIn(String key) {
    return pref?.getBool(key);
  }

  // CacheData() {
  //   log('Shared service has been started..');
  // }
  // Future<String> userName() async {
  //   final cache = await SharedPreferences.getInstance();
  //   return cache.getString('name') ?? '';
  // }

  // Future<void> setName({required String username}) async {
  //   final cache = await SharedPreferences.getInstance();
  //   cache.setString('name', username);
  // }
}
