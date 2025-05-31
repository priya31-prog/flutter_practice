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
  String _inputValue = '';
  String _errorText = '';

  String get inputValue => _inputValue;
  String get errorText => _errorText;
  String updateInputValue(String value, bool height) {
    _inputValue = value;

    // Validate the input range between 1 and 150
    double parsedValue = double.tryParse(value) ?? 0;
    if (parsedValue < 1 || height ? parsedValue > 250 : parsedValue > 150) {
      return _errorText = 'Value must be between 1 and 250';
    } else {
      return _errorText = '';
    }

    // Notify listeners (Consumer will rebuild)
  }

  String getBMI(double bmi) {
    if (bmi >= 16 && bmi <= 18.5) {
      return 'under weight';
    } else if (bmi > 18.5 && bmi <= 25) {
      return 'normal';
    } else if (bmi > 25 && bmi <= 35) {
      return 'over weight';
    } else if (bmi > 35) {
      return 'obsity';
    } else {
      return '';
    }
  }

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String err = '';

  SlidersClass({super.key});
  // int age = 10;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = ref.watch(bmiHeight);
    double weight = ref.watch(weightProvider);
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

                      onChanged: (value) {
                        err = updateInputValue(value, false);

                        if (err == '') {
                          ref
                              .read(weightProvider.notifier)
                              .state = double.parse(weightController.text);
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
                      onChanged: (value) {
                        err = updateInputValue(value, true);
                        if (err == '') {
                          ref.read(bmiHeight.notifier).state = double.parse(
                            heightController.text,
                          );

                          if (value.isEmpty) {
                            ref.read(bmiHeight.notifier).state = 1.0;
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
                getBMI((weight / (height / 100 * height / 100))) == ''
                    ? 'You are  ${getBMI((weight / (height / 100 * height / 100)))}'
                    : '',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
