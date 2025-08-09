class CommonUtils {
  static String firstLetterCaps({required String name}) {
    return (name[0].toUpperCase() + name.substring(1));
  }

  static String discountedPrice({
    required double price,
    required double discount,
  }) {
    var newPrice = price * (1 - discount / 100);
    return newPrice.toStringAsFixed(2);
  }

  // static double cartPrice({required double price, required double discount}) {
  //   var nPrice = price - ((price * discount) / 100);
  //   return nPrice;
  // }
}
