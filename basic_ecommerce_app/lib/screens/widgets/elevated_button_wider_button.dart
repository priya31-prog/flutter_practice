import 'package:flutter/material.dart';

Widget elevatedButtonWider({
  required VoidCallback onTap,
  required String text,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
  TextStyle? textStyle,
}) {
  return InkWell(
    onTap: onTap,
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
  );
}
