import 'package:flutter/material.dart';

class HeroWigetScreen extends StatefulWidget {
  const HeroWigetScreen({super.key});

  @override
  State<HeroWigetScreen> createState() => _HeroWigetScreenState();
}

class _HeroWigetScreenState extends State<HeroWigetScreen> {
  bool _showSmall = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Transition between 2 widgets using hero..'),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSmall = !_showSmall;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child:
                        _showSmall
                            ? Hero(
                              tag: 'my-hero',
                              child: Container(
                                key: ValueKey('small'),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            )
                            : SizedBox.shrink(),
                  ),
                  !_showSmall
                      ? Hero(
                        tag: 'my-hero',
                        child: Container(
                          key: ValueKey('large'),
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
