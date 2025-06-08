import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isolates_mixins/API/users_model.dart';

//BMI
final expandProvider = StateProvider<bool>((ref) => false);
final bmiHeight = StateProvider<double>((ref) => 1);
final weightProvider = StateProvider<double>((ref) => 1.0);
final weightError = StateProvider<String>((ref) => '');
final finalBMI = StateProvider<String>((ref) => '');

//scroll pagination
final loadingNextScroll = StateProvider<bool>((ref) => false);
final scrollPages = StateProvider<int>((ref) => 1);
final scrollItemsPerPage = StateProvider<int>((ref) => 25);
final userData = StateProvider<List<UsersModel>>((ref) => []);
final singlePageItem = StateProvider<List<UsersModel>>((ref) => []);

// numbered pagination
