import 'package:flutter/material.dart';

Widget elevatedButtonWider({
  required VoidCallback onTap,
  required String text,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
  TextStyle? textStyle,
  bool? isDisabled,
}) {
  return InkWell(
    onTap: () {
      if (isDisabled ?? false) {
      } else {
        onTap;
      }
    },
    child: Opacity(
      opacity: getBgColorOpacity(isDisabled: isDisabled ?? false),
      child: Container(
        padding: padding ?? EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.cyan,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              textStyle ??
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

double getBgColorOpacity({
  // required Color backgroundColor,
  required bool isDisabled,
}) {
  if (isDisabled) {
    return 0.3;
  }
  return 1;
}
