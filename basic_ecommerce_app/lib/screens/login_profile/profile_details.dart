// import 'dart:math';

import 'dart:developer';

import 'package:basic_ecommerce_app/screens/login_profile/profile_notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                minRadius: 70,
                maxRadius: 80,

                //network image -from api profile URL (upload the image and get the string here)
                child: Icon(Icons.person_2_outlined, size: 29),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
