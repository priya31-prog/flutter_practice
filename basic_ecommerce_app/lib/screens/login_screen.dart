import 'package:basic_ecommerce_app/state_management/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    final mail = ref.watch(email);
    final mobile = ref.watch(phone);
    final isEditingCompleted = ref.watch(isCredEntered);
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
              onSubmitted: (value) {
                ref.read(email.notifier).state = value;
                if (getAllCredDone(mail: mail, phone: mobile)) {
                  ref.read(isCredEntered.notifier).state = true;
                }
              },
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
              onSubmitted: (value) {
                // print('inside pass');
                ref.read(phone.notifier).state = value;
                if (getAllCredDone(mail: mail, phone: mobile)) {
                  ref.read(isCredEntered.notifier).state = true;
                }
              },
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

            isEditingCompleted
                ? ElevatedButton(onPressed: () {}, child: Text('Submit'))
                : SizedBox.shrink(),
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

bool getAllCredDone({String? mail, String? phone}) {
  if (mail == '' || phone == '') {
    return false;
  }
  return true;
}
