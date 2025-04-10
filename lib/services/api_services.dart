import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();
  final Uri uri = Uri.parse("http://192.168.244.212:5631/api/v1");

  Future<void> registerUser({
    required String name,
    required String email,
    required String pass,
  }) async {
    try {
      final http.Response res = await http.post(uri);
      if (res.statusCode != 201) {
        print(jsonDecode(res.body));
        // return jsonDecode(res.body);
      }
      print(jsonDecode(res.body));
      // return jsonDecode(res.body);
    } catch (err) {
      // return {"message": ""};
      print(err);
    }
  }
}
