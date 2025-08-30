// import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
// import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
// import 'package:basic_ecommerce_app/screens/login_profile/auth_service.dart';
// import 'package:basic_ecommerce_app/screens/login_profile/user_info_model.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAddress extends StatefulWidget {
  const UserAddress({super.key, required this.userAddressParams});

  final UserAddressParams userAddressParams;
  @override
  State<UserAddress> createState() => _UserAddress();
}

class _UserAddress extends State<UserAddress> {
  final _formKey = GlobalKey<FormState>();
  final _addressLine1 = TextEditingController();
  final _addressLine2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _pincode = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _addressLine1.dispose();
    _addressLine2.dispose();
    _city.dispose();
    _phoneNumber.dispose();
    _state.dispose();
    _pincode.dispose();
  }

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
                  controller: _addressLine1,
                  onChanged: (value) {},
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

                TextFormField(
                  controller: _addressLine2,
                  cursorColor: Colors.cyan,
                  maxLines: null,
                  maxLength: 200,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    label: Text('Address Line 2'),
                    floatingLabelStyle: TextStyle(color: Colors.cyan),
                    fillColor: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(50),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: elevatedButtonWider(
                        onTap: () async {
                          // await AuthService()
                          //     .signingInUser(
                          //       user: UserInfoModel(
                          //         mailId: widget.userAddressParams.email,
                          //         userName: widget.userAddressParams.userName,
                          //       ),
                          //       password: widget.userAddressParams.password,
                          //       ref: widget.userAddressParams.ref,
                          //     )
                          //     .then((final val) {
                          //       CacheData.instance.setUserLoggedIn(true);
                          //       if (!context.mounted) return;
                          //       Navigator.pushNamed(
                          //         context,
                          //         RouteNavigations.homeScreenWithoutSkip,
                          //       );
                          //     });
                        },
                        text: 'Submit',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserAddressParams {
  final String email;
  final String password;
  final WidgetRef ref;
  final String userName;

  UserAddressParams({
    required this.email,
    required this.password,
    required this.ref,
    required this.userName,
  });
}
