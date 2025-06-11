import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDataLoaded = StateProvider<bool>((ref) => true);
final isCredEntered = StateProvider<bool>((ref) => false);
final email = StateProvider<String>((ref) => '');
final phone = StateProvider<String>((ref) => '');
