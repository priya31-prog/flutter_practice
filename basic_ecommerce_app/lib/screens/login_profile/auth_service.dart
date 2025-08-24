import 'dart:developer';

import 'package:basic_ecommerce_app/screens/login_profile/user_info_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      log('logging inside auth');
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      log('piegon -- ${userCredential.user}');

      return userCredential.user;
    } catch (e) {
      log('Exception from auth service ${e}');
      return null;
    }
  }

  Future<UserInfoModel?> signingInUser({
    required UserInfoModel user,
    required String password,
  }) async {
    try {
      final UserCredential userCred = await _auth
          .createUserWithEmailAndPassword(
            email: user.mailId ?? '',
            password: password,
          );

      user.userId = userCred.user?.uid;
      if (userCred.user != null) {
        final docRef = FirebaseFirestore.instance
            .collection('user_information')
            .doc(user.userId);

        await docRef.set(user.toJson());

        // await docRef.update({
        //   "users": FieldValue.arrayUnion([user.toJson()]),
        // });

        final snapshot = await docRef.get();

        final data = snapshot.data() ?? {};

        // Convert to userModel model
        log('user info modified.. ${userCred.user}');
        final allUsers = UserInfoModel.fromJson(data);
        return allUsers;
      }
    } catch (e) {
      log('print error in users ${e}');
    }
    return null;
  }
}
