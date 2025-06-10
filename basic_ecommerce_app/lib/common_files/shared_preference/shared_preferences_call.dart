import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  CacheData() {
    log('Shared service has been started..');
  }
  Future<String> userName() async {
    final cache = await SharedPreferences.getInstance();
    return cache.getString('name') ?? '';
  }

  Future<void> setName({required String username}) async {
    final cache = await SharedPreferences.getInstance();
    cache.setString('name', username);
  }
}
