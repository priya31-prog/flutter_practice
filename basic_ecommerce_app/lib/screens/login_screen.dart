import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
