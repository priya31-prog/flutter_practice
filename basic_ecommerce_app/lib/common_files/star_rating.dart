import 'package:flutter/material.dart';

Widget buildStarRating({required double rating}) {
  int fullStar = rating.floor();
  bool halfStar = (rating - fullStar) >= 0.5;
  int emptyStar = 5 - fullStar - (halfStar ? 1 : 0);
  return Row(
    children: [
      for (int i = 0; i < fullStar; i++)
        Icon(Icons.star, color: Colors.cyan, size: 20),
      if (halfStar) Icon(Icons.star_half, color: Colors.cyan, size: 20),
      for (int i = 0; i < emptyStar; i++)
        Icon(Icons.star, color: Colors.grey, size: 20),
    ],
  );
}
