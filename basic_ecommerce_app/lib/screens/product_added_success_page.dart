import 'package:basic_ecommerce_app/screens/dialogs/local_notifications.dart';
import 'package:basic_ecommerce_app/screens/widgets/elevated_button_wider_button.dart';
import 'package:flutter/material.dart';

//use animation here
class ProductAddedSuccessPage extends StatefulWidget {
  const ProductAddedSuccessPage({super.key});

  @override
  State<ProductAddedSuccessPage> createState() =>
      _ProductAddedSuccessPageState();
}

class _ProductAddedSuccessPageState extends State<ProductAddedSuccessPage> {
  @override
  void initState() {
    super.initState();
    showLocalNotification();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            // color: Colors.yellow,
            border: Border.all(color: Colors.cyan),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            spacing: 35,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 800),
                builder: (BuildContext context, double _val, Widget? child) {
                  return Opacity(
                    opacity: _val,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: _val * (MediaQuery.of(context).size.width * 0.18),
                      ),
                      child: child,
                    ),
                  );
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(height: 100, width: 100),
                      Icon(Icons.check, color: Colors.white, size: 50),
                    ],
                  ),
                ),

                // ClipRRect(
                //   borderRadius: BorderRadius.circular(50),
                //   child: ColoredBox(
                //     color: Colors.cyan,
                //     child: SizedBox(height: 100, width: 100),
                //   ),
                // ),

                //  Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.cyan,
                //   ),
                // ),
              ),
              Text(
                'Your order is confirmed',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Expanded(
                    child: elevatedButtonWider(onTap: () {}, text: 'Done'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
