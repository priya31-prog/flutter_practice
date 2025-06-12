// ignore_for_file: prefer_typing_uninitialized_variables

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
                  ).colorScheme.secondary.withAlpha(30),
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
                  ).colorScheme.secondary.withAlpha(30),
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
                  ).colorScheme.secondary.withAlpha(30),
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
                  ).colorScheme.secondary.withAlpha(30),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.withAlpha(120),
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
