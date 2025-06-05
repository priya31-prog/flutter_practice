class CommonUtils {
  static String updateInputValue(String value, bool height) {
    String errorText = '';

    double parsedValue = double.tryParse(value) ?? 0;
    if (parsedValue < 1 || height ? parsedValue > 250 : parsedValue > 150) {
      return errorText = 'Value must be between 1 and 250';
    } else {
      return errorText;
    }
  }

  static Future<String> getBMI({
    double height = 1.0,
    double weight = 1.0,
  }) async {
    var bmi = getBmiValue(height: height, weight: weight);

    if (bmi >= 16 && bmi <= 18.5) {
      return 'under weight';
    } else if (bmi > 18.5 && bmi <= 25) {
      return 'normal';
    } else if (bmi > 25 && bmi <= 35) {
      return 'over weight';
    } else if (bmi > 35) {
      return 'obsese';
    } else {
      return '';
    }
  }

  static double getBmiValue({required double height, required double weight}) {
    return (weight / ((height / 100) * (height / 100)));
  }

  static void clearText() {}
}
