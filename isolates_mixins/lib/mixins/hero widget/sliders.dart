import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/state_management/state_provider.dart';

// class SlidersClass extends StatefulWidget {
//   const SlidersClass({super.key});

//   @override
//   State<SlidersClass> createState() => _SlidersClassState();
// }

// ignore: must_be_immutable
class SlidersClass extends ConsumerWidget {
  SlidersClass({super.key});

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String err = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = ref.watch(bmiHeight);
    double weight = ref.watch(weightProvider);
    String bmiResult = ref.watch(finalBMI);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Calculate your BMI using slider',
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 40),
              Text('Weight here'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Slider(
                      value: weight,
                      divisions: 20,
                      onChanged: (value) {
                        ref.read(weightProvider.notifier).state = value;
                      },
                      min: 1,
                      max: 150,
                      label: 'weight',
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    width: 70,
                    child: TextField(
                      controller: weightController,

                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}$'),
                        ), // Only numbers and a decimal point
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 2),
                        errorText: err == '' ? null : err,
                        label: Text('kg'),
                      ),

                      onChanged: (value) async {
                        err = updateInputValue(value, false);

                        if (err == '') {
                          ref
                              .read(weightProvider.notifier)
                              .state = double.parse(weightController.text);
                          if (height > 1 && weight > 1) {
                            var val = await getBMI(
                              weight / ((height / 100) * (height / 100)),
                            );
                            ref.read(finalBMI.notifier).state = val;
                          }
                        }

                        // weightController.text.toDouble();
                      },
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(text: 'Your weight : '),
                    TextSpan(
                      text: weight.toString(),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Text('Height here'),

              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: height.toDouble(),
                      divisions: 20,
                      onChanged: (value) {
                        // setState(() {
                        //   age = value.toInt();
                        // });
                        ref.read(bmiHeight.notifier).state = value;
                      },
                      min: 1,
                      max: 250,
                      label: 'height',
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    width: 70,
                    child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        label: Text('cm'),
                        border: OutlineInputBorder(gapPadding: 2),
                        errorText: err == '' ? null : err,
                      ),
                      onChanged: (value) async {
                        err = updateInputValue(value, true);
                        if (err == '') {
                          ref.read(bmiHeight.notifier).state = double.parse(
                            value,
                          );
                          if (int.parse(value) > 1 && weight > 1) {
                            var val = await getBMI(
                              weight /
                                  ((int.parse(value) / 100) *
                                      (int.parse(value) / 100)),
                            );
                            ref.read(finalBMI.notifier).state = val;
                          }
                          if (value.isEmpty) {
                            ref.read(bmiHeight.notifier).state = 1.0;
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(text: 'Your height : '),
                    TextSpan(
                      text: height.toString(),
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(text: 'Your BMI is : '),
                    TextSpan(
                      text:
                          height > 1.0 && weight > 1.0
                              ? (weight / (height / 100 * height / 100))
                                  .toStringAsFixed(2)
                              : '0.0',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),

              Text(
                bmiResult != '' ? 'You are  ${bmiResult}' : 'hae',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
