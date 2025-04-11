import 'package:bloc/bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/counter/counter_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCount>(_increment);
    on<DecrementCount>(_decrement);
  }

  void _increment(IncrementCount event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCount event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
