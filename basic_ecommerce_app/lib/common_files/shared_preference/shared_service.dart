// import 'dart:developer';

import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
import 'package:get_it/get_it.dart';

class SharedService {
  final getIt = GetIt.instance;

  void registerCacheData() {
    getIt.registerSingleton<CacheData>(CacheData());
  }
}
