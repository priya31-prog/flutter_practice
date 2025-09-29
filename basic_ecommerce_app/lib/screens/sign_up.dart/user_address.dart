import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
import 'package:basic_ecommerce_app/screens/login_profile/auth_service.dart';
import 'package:basic_ecommerce_app/api%20files/models/user_info_model.dart';

import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/get_indian_state.dart';
import 'package:basic_ecommerce_app/api%20files/models/state_model.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  // final _state = TextEditingController();
  final _pincode = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _landMark = TextEditingController();
  List<StateModel> listOfStates = [];
  late String selectedState;

  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      listOfStates = await fetchStates();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    _addressLine1.dispose();
    _addressLine2.dispose();
    _city.dispose();
    _phoneNumber.dispose();
    // _state.dispose();
    _pincode.dispose();
    _landMark.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'address 1';
                      }
                      return '';
                    },
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
                  TextFormField(
                    controller: _city,
                    cursorColor: Colors.cyan,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter city';
                      }
                      return null;
                    },
                    // onChanged: (),
                    decoration: InputDecoration(
                      label: Text('City'),
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
                  DropdownButtonFormField(
                    hint: Text('Select your state'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Select state';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(
                        context,
                      ).colorScheme.secondary.withAlpha(50),

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items:
                        listOfStates.map((final value) {
                          return DropdownMenuItem(
                            value: value.name,
                            child: Text(value.name),
                            onTap: () {
                              setState(() {
                                selectedState = value.name;
                              });
                              log('message selected state $selectedState');
                            },
                          );
                        }).toList(),

                    onChanged: (value) {},
                  ),
                  TextFormField(
                    controller: _pincode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter pincode';
                      }
                      return null;
                    },

                    cursorColor: Colors.cyan,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      label: Text('Pincode'),
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
                  TextFormField(
                    controller: _phoneNumber,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final exp = RegExp(
                          r'^\+?[0-9]{1,3}[-.\s]?(\(?[0-9]{1,4}\)?[-.\s]?)?[0-9]{3,4}[-.\s]?[0-9]{4}$',
                        );

                        if (!exp.hasMatch(value)) {
                          return 'Number is incorrect';
                        }
                      } else if (value == null || value.isEmpty) {
                        return 'proper phone';
                      }
                      return null;
                    },
                    cursorColor: Colors.cyan,

                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      prefix: Container(
                        margin: EdgeInsets.all(3),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 81, 74, 74),
                        ),

                        child: Text('+91'),
                      ),
                      label: Text('Phone number'),

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

                  TextFormField(
                    controller: _landMark,
                    cursorColor: Colors.cyan,
                    maxLines: null,
                    maxLength: 200,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      label: Text('Land Mark'),
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
                            if (_formKey.currentState!.validate()) {
                              await AuthService()
                                  .signingInUser(
                                    user: UserInfoModel(
                                      mailId: widget.userAddressParams.email,
                                      userName:
                                          widget.userAddressParams.userName,
                                      address: Address(
                                        addressLine1: _addressLine1.text,
                                        addressLine2: _addressLine2.text,
                                        phnNo: _phoneNumber.text,
                                        landMark: _landMark.text,
                                        pincode: _pincode.text,
                                        state: selectedState,
                                      ),
                                    ),
                                    password: widget.userAddressParams.password,
                                    ref: widget.userAddressParams.ref,
                                  )
                                  .then((final val) {
                                    CacheData.instance.setUserLoggedIn(true);
                                    if (!context.mounted) return;
                                    Navigator.pushNamed(
                                      context,
                                      RouteNavigations.homeScreenWithoutSkip,
                                    );
                                  });
                            } else {
                              Fluttertoast.showToast(
                                msg:
                                    'Please fill all the field or Do click on Skip to proceed',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                              );
                            }
                          },
                          text: 'Submit',
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      await AuthService()
                          .signingInUser(
                            user: UserInfoModel(
                              mailId: widget.userAddressParams.email,
                              userName: widget.userAddressParams.userName,
                            ),
                            password: widget.userAddressParams.password,
                            ref: widget.userAddressParams.ref,
                          )
                          .then((final val) {
                            CacheData.instance.setUserLoggedIn(true);
                            if (!context.mounted) return;
                            Navigator.pushNamed(
                              context,
                              RouteNavigations.homeScreenWithoutSkip,
                            );
                          });
                    },
                  ),
                ],
              ),
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
