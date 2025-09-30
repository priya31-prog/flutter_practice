import 'dart:async';
import 'dart:developer';
import 'package:basic_ecommerce_app/api%20files/models/user_info_model.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends AsyncNotifier<UserInfoModel> {
  @override
  FutureOr<UserInfoModel> build() async {
    final user = ref.watch(userId); // create one and call here
    return await fetchUser(userId: user);
  }

  Future<UserInfoModel> fetchUser({required String userId}) async {
    final docRef = FirebaseFirestore.instance
        .collection('user_information')
        .doc(userId);

    final snapShot = await docRef.get();

    final userDataJson = snapShot.data();

    log('user data json from profile notifier -- $userDataJson');

    final userJson = UserInfoModel.fromJson(userDataJson ?? {});
    // CacheData.instance.setUserLoggedIn('isUserLoggedIn', true);
    state = AsyncData(userJson);
    return userJson;
  }
}

final profileProvider = AsyncNotifierProvider<ProfileNotifier, UserInfoModel>(
  ProfileNotifier.new,
);
