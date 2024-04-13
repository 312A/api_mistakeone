import 'dart:convert';

import 'package:api/home/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getuserData() async {
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      return List<UserModel>.from(result.map((e) => UserModel.fromJson(e)));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
