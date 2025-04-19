import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/model/user_model.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/provider/user_provider.dart';

abstract class IUserRepository {
  Future<UserModel> getUsers();
}

class UserRepository implements IUserRepository {
  final UserProvider userProvider;
  UserRepository({required this.userProvider});

  @override
  Future<UserModel> getUsers() {
    return userProvider.getUsers();
  }
}
