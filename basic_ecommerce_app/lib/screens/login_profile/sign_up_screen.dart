// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/screens/login_profile/auth_service.dart';
import 'package:basic_ecommerce_app/screens/login_profile/user_info_model.dart';
import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final _emailController;
  late final _nameController;
  late final _passwordController;
  late final _cnfpswdController;

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.secondary.withAlpha(150),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              Text("Sign Up", style: TextStyle(fontSize: 35)),

              TextField(
                controller: _nameController,
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
              TextField(
                controller: _emailController,

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
              TextField(
                controller: _passwordController,
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
              TextField(
                controller: _cnfpswdController,
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
                        log('email ${_emailController.text}');
                        log('password ${_passwordController.text}');

                        await AuthService()
                            .signingInUser(
                              user: UserInfoModel(
                                mailId: _emailController.text,
                                userName: _nameController.text,
                              ),
                              password: _passwordController.text,
                            )
                            .then((final val) {
                              log('Saved in firebase and logged in..');
                            });
                        // try {
                        //   final credential = await FirebaseAuth.instance
                        //       .createUserWithEmailAndPassword(
                        //         email: _emailController.text,
                        //         password: _passwordController.text,
                        //       );
                        //   log('password and user id created successfully');
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'weak-password') {
                        //     log(' The password provided is too weak ');
                        //   } else if (e.code == 'email-already-in-use') {
                        //     log('The account already exists in mail');
                        //   }
                        // } catch (e) {
                        //   log('error from firebase ${e}');
                        // }

                        // Navigator.pushNamed(
                        //   context,
                        //   RouteNavigations.homeScreenWithoutSkip,
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
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
