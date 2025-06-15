import 'package:flutter/widgets.dart';

TableRow tableRowWidget({
  required final String titleText,
  required final String nextRowText,
}) {
  return TableRow(
    children: [
      Padding(padding: const EdgeInsets.all(8.0), child: Text(titleText)),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(nextRowText, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
