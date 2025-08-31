import 'dart:convert';
import 'dart:developer';

import 'package:basic_ecommerce_app/api%20files/models/state_model.dart';
import 'package:flutter/services.dart';

Future<List<StateModel>> fetchStates() async {
  final response = await rootBundle.loadString(
    'assets/json/indian_states.json',
  );
  final List<dynamic> data = await json.decode(response);

  final List<StateModel> stateMapped =
      data.map((final state) => StateModel.fromJson(state)).toList();

  log('Log the state response data ${stateMapped.length}');

  return stateMapped;
}
