// import 'dart:math';

import 'dart:developer';

import 'package:basic_ecommerce_app/screens/login_profile/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetails extends ConsumerStatefulWidget {
  const ProfileDetails({super.key});

  @override
  ConsumerState<ProfileDetails> createState() => _ProfileDetails();
}

class _ProfileDetails extends ConsumerState<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    final profileDetails = ref.watch(profileProvider);
    log('profile imgae ${profileDetails.value?.profileUrl}');
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 70,
              maxRadius: 100,

              child: Image.network(
                '${profileDetails.value!.profileUrl ?? false}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
