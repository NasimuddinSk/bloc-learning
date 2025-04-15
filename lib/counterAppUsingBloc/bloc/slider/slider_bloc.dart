import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_event.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SlideSlider>(_slider);
  }

  void _slider(SlideSlider event, Emitter<SliderState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
