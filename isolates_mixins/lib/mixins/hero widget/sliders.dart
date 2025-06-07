import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/common_files/common_functions.dart';
import 'package:isolates_mixins/state_management/state_provider.dart';

class SlidersClass extends ConsumerStatefulWidget {
  const SlidersClass({super.key});

  @override
  ConsumerState<SlidersClass> createState() => _SlidersClass();
}

class _SlidersClass extends ConsumerState<SlidersClass> {
  // _SlidersClass({super.key});

  // TextEditingController weightController = TextEditingController();
  // TextEditingController heightController = TextEditingController();

  late TextEditingController weightController;
  late TextEditingController heightController;
  String err = '';

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  void clear() {
    weightController.clear();
    heightController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
                      // divisions: 5,
                      onChanged: (value) async {
                        ref.read(weightProvider.notifier).state = value;
                        if (value > 1 && height > 1) {
                          var val = await CommonUtils.getBMI(
                            height: height,
                            weight: value,
                          );
                          ref.read(finalBMI.notifier).state = val;
                        }
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
                      onEditingComplete: () {
                        clear();
                      },

                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'^0$'),
                        ), // Only numbers and a decimal point
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding: 2),
                        errorText: err == '' ? null : err,
                        label: Text('kg'),
                      ),

                      onChanged: (value) async {
                        err = CommonUtils.updateInputValue(value, false);

                        if (err == '') {
                          ref.read(weightProvider.notifier).state =
                              value.isEmpty ? 1.0 : double.parse(value);

                          if (int.parse(value) > 1 && height > 1) {
                            var val = await CommonUtils.getBMI(
                              height: height,
                              weight: double.parse(value),
                            );
                            ref.read(finalBMI.notifier).state = val;
                          }

                          if (value.isEmpty) {
                            ref.read(weightProvider.notifier).state = 1.0;
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
                    TextSpan(text: 'Your weight : '),
                    TextSpan(
                      text: weight.toStringAsFixed(2),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
                      // divisions: 5,
                      onChanged: (value) async {
                        ref.read(bmiHeight.notifier).state = value;
                        if (value > 1 && weight > 1) {
                          var val = await CommonUtils.getBMI(
                            height: value,
                            weight: weight,
                          );
                          ref.read(finalBMI.notifier).state = val;
                        }
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
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^0$')),
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onEditingComplete: () {
                        clear();
                      },
                      decoration: InputDecoration(
                        label: Text('cm'),
                        border: OutlineInputBorder(gapPadding: 2),
                        errorText: err == '' ? null : err,
                      ),
                      onChanged: (value) async {
                        // heightController.text = value;
                        err = CommonUtils.updateInputValue(value, true);
                        if (err == '') {
                          ref.read(bmiHeight.notifier).state =
                              value.isEmpty ? 1.0 : double.parse(value);
                          if (int.parse(value) > 1 && weight > 1) {
                            var val = await CommonUtils.getBMI(
                              height: double.parse(value),
                              weight: weight,
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
                      text: height.toStringAsFixed(2),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
                              ? CommonUtils.getBmiValue(
                                height: height,
                                weight: weight,
                              ).toStringAsFixed(2)
                              : '0.0',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                bmiResult != '' ? 'You are  $bmiResult' : '',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
