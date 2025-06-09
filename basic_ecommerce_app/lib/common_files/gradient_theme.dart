import 'package:flutter/material.dart';

@immutable
class GradientTheme extends ThemeExtension<GradientTheme> {
  final Gradient primaryGradient;

  const GradientTheme({required this.primaryGradient});

  @override
  GradientTheme copyWith({Gradient? primaryGradient}) {
    return GradientTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  GradientTheme lerp(ThemeExtension<GradientTheme>? other, double t) {
    if (other is! GradientTheme) return this;
    return GradientTheme(
      primaryGradient:
          Gradient.lerp(primaryGradient, other.primaryGradient, t)!,
    );
  }
}
