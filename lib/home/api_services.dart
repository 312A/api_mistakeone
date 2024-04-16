import 'dart:convert';

import 'package:api/home/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> getuserData() async {
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body)["page"]);
      
      final result = jsonDecode(response.body);
      print(result);
      // return <UserModel>.from(result.map((e) => UserModel.fromJson(e)));
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
