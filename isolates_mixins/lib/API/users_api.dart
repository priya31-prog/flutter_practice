import 'dart:convert';

import 'package:isolates_mixins/API/users_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final String url = 'https://testapi.devtoolsdaily.com/users';

  Future<List<UsersModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    // log('response from api ...${json.decode(response.body)}');

    //sample
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((ele) => UsersModel.fromJson(ele)).toList();
    } else {
      throw Exception('Failed to load users..');
    }
  }
}
