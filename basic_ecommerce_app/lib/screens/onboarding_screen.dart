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
          ],
        ),
      ),
    );
  }
}
