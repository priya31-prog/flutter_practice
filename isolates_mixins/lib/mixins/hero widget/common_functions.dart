class CommonUtils {
  static String updateInputValue(String value, bool height) {
    String errorText = '';

    // Validate the input range between 1 and 150
    double parsedValue = double.tryParse(value) ?? 0;
    if (parsedValue < 1 || height ? parsedValue > 250 : parsedValue > 150) {
      return errorText = 'Value must be between 1 and 250';
    } else {
      return errorText;
    }
  }

  Future<String> getBMI(double bmi) async {
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
}
