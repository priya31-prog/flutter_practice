// ignore_for_file: prefer_typing_uninitialized_variables

// import 'dart:developer';

import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
// import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
// import 'package:basic_ecommerce_app/screens/login_profile/auth_service.dart';
// import 'package:basic_ecommerce_app/screens/login_profile/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late final _emailController;
  late final _nameController;
  late final _passwordController;
  late final _cnfpswdController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _cnfpswdController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _cnfpswdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(150),
                    size: 35,
                  ),

                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                Text("Sign Up", style: TextStyle(fontSize: 35)),

                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',

                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(200),
                    ),

                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email to proceed';
                    } else {
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.+[\w-]{2,4}$)',
                      );

                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter valid mail';
                      }
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(200),
                    ),
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    } else {
                      final pswdRegEx = RegExp(
                        r'^(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{3,}$',
                      );

                      if (!pswdRegEx.hasMatch(value)) {
                        return 'Enter valid password';
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(200),
                    ),
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _cnfpswdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter confirm password';
                    } else {
                      if (value != _passwordController.text) {
                        return 'Mismatch in password and Confirm password';
                      }

                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(200),
                    ),
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(
                              context,
                              RouteNavigations.userAddressPage,
                            );
                            // log('current state validated');
                            // await AuthService()
                            //     .signingInUser(
                            //       user: UserInfoModel(
                            //         mailId: _emailController.text,
                            //         userName: _nameController.text,
                            //       ),
                            //       password: _passwordController.text,
                            //       ref: ref,
                            //     )
                            //     .then((final val) {
                            //       CacheData.instance.setUserLoggedIn(true);
                            //       if (!context.mounted) return;
                            //       Navigator.pushNamed(
                            //         context,
                            //         RouteNavigations.homeScreenWithoutSkip,
                            //       );
                            //     });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to save')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account ?"),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text('Sign Up', style: TextStyle(color: Colors.cyan)),
            ),
          ],
        ),
      ),
    );
  }
}
