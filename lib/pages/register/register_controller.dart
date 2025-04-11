import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/pages/register/user_model.dart';

class RegisterController {
  final String apiUrl = "http://192.168.244.212:5631/api/v1";
  // http://localhost:5631/api/v1/users/register
  Future<void> registerUser(UserModel model) async {
    try {
      final http.Response res = await http.post(
        Uri.parse("$apiUrl/users/register"),
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "name": model.name,
          "email": model.email,
          "password": model.password,
        }),
      );

      final data = jsonDecode(res.body);
      print(data["message"]);
    } catch (err) {
      print("Error while register -$err");
    }
  }
}
