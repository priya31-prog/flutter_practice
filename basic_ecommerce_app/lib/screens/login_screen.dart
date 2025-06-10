import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // SizedBox(height: 20),
            Text('Login or Sign Up', style: TextStyle(fontSize: 30)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Theme.of(
                  context,
                ).colorScheme.secondary.withAlpha(30),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Theme.of(
                  context,
                ).colorScheme.secondary.withAlpha(30),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            InkWell(
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary.withAlpha(250),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? "),
            InkWell(
              onTap: () {},
              child: Text('Sign Up', style: TextStyle(color: Colors.cyan)),
            ),
          ],
        ),
      ),
    );
  }
}
