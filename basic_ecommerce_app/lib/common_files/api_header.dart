import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> getHeaders({bool withAuth = false}) async {
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  if (withAuth) {
    // Fetch token from local storage
    final preference = await SharedPreferences.getInstance();
    final token = preference.getString('token') ?? '';
    headers['Authorization'] = 'Token $token'; // Or Bearer
  }

  return headers;
}
