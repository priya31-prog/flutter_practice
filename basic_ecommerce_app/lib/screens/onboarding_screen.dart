import 'package:basic_ecommerce_app/common_files/gradient_theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
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
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Next'),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
