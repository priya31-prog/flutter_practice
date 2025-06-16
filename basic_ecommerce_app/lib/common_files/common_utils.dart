class CommonUtils {
  static String firstLetterCaps({required String name}) {
    return (name[0].toUpperCase() + name.substring(1));
  }

  static String discountedPrice({
    required double price,
    required double discount,
  }) {
    var new_price = price - ((price * discount) / 100);
    return new_price.toStringAsFixed(2);
  }
}
