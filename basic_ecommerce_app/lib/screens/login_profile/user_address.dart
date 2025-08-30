import 'package:flutter/material.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key});

  @override
  State<UserAddress> createState() => _UserAddress();
}

class _UserAddress extends State<UserAddress> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 30,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withAlpha(190),
                        size: 35,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    Text(
                      'Location Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextFormField(
                  maxLength: 200,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  cursorColor: Colors.cyan,
                  // enableSuggestions: true,
                  decoration: InputDecoration(
                    // hintText: 'Address Line 1',

                    //alternate for hint text without label floating but disappears once tapped on the field
                    label: Text(
                      'Address Line 1',
                      // style: TextStyle(color: Colors.cyan),
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.cyan),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
