import 'dart:developer';

// import 'package:basic_ecommerce_app/screens/login_profile/profile_notifier.dart';
import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
import 'package:basic_ecommerce_app/screens/login_profile/profile_notifier.dart';
import 'package:basic_ecommerce_app/api%20files/models/user_info_model.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginWithEmail({
    required String email,
    required String password,
    required WidgetRef ref,
  }) async {
    try {
      log('logging inside auth');
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user?.uid != null) {
        ref.read(userId.notifier).state = userCredential.user?.uid ?? '';
        CacheData.instance.setUserLoggedIn(true);
        ref
            .read(profileProvider.notifier)
            .fetchUser(userId: userCredential.user!.uid);
        log('piegon -- ${userCredential.user}');
      }

      return userCredential.user;
    } catch (e) {
      log('Exception from auth service ${e}');
      return null;
    }
  }

  Future<void> signingInUser({
    required UserInfoModel user,
    required String password,
    required WidgetRef ref,
  }) async {
    try {
      final UserCredential userCred = await _auth
          .createUserWithEmailAndPassword(
            email: user.mailId ?? '',
            password: password,
          );

      user.userId = userCred.user?.uid;
      if (userCred.user != null) {
        ref.read(userId.notifier).state = userCred.user?.uid ?? '';
        final docRef = FirebaseFirestore.instance
            .collection('user_information')
            .doc(user.userId);

        await docRef.set(user.toJson());

        // await docRef.update({
        //   "users": FieldValue.arrayUnion([user.toJson()]),
        // });

        ref
            .read(profileProvider.notifier)
            .fetchUser(userId: userCred.user!.uid);
      }
    } catch (e) {
      log('print error in users ${e}');
    }
    return null;
  }
}
