import 'package:basic_ecommerce_app/common_files/gradient_theme.dart';
import 'package:basic_ecommerce_app/common_files/route_navigations.dart';
import 'package:basic_ecommerce_app/common_files/shared_preference/shared_preferences_call.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return Theme.of(context)
                      .extension<GradientTheme>()!
                      .primaryGradient
                      .createShader(bounds);
                },

                child: Image(
                  image: AssetImage('assets/images/gadget_image.jpeg'),

                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 25),

              Text(
                'Welcome to \nElectroCart',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: elevatedButtonWider(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNavigations.loginPage,
                          );
                        },
                        text: 'Next',
                        textStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),
              TextButton(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 150, 148, 148),
                  ),
                ),
                onPressed: () {
                  //on click of skip navigate to welcome page which loads all the gadgets
                  CacheData.instance.setUserLoggedIn(false);
                  Navigator.popAndPushNamed(
                    context,
                    RouteNavigations.homeScreenSkip,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
