import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {}

class SlideSlider extends SliderEvent {
  final double sliderValue;
  SlideSlider({this.sliderValue = 1});
  @override
  List<Object?> get props => [sliderValue];
}
