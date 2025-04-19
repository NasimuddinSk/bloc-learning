import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_event.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_state.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitialState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepository.getUsers();

        emit(UserSuccessState(users));
        //
      } catch (err) {
        emit(UserErrorState(err.toString()));
      }
    });
  }
}
