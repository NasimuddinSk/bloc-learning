import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<NotificationEnableOrDisable>(_notification);
  }

  void _notification(NotificationEnableOrDisable event, Emitter emit) {
    emit(state.copyWith(isEnable: !state.isEnable));
  }
}
