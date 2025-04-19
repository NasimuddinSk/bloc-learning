import 'package:dio/dio.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/model/user_model.dart';

class UserProvider {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api/"));

  Future<UserModel> getUsers() async {
    try {
      final Response<String> response = await _dio.get("users?page=2");

      return userModelFromJson(response.toString());
    } catch (err) {
      return Future.error(err.toString());
    }
  }
}
