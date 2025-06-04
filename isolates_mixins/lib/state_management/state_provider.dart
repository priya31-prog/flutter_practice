import 'package:flutter_riverpod/flutter_riverpod.dart';

final expandProvider = StateProvider<bool>((ref) => false);
final bmiHeight = StateProvider<double>((ref) => 1);
final weightProvider = StateProvider<double>((ref) => 1.0);
final weightError = StateProvider<String>((ref) => '');
final finalBMI = StateProvider<String>((ref) => '');
