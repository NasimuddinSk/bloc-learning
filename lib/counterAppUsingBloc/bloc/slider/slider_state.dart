import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double sliderValue;
  const SliderState({this.sliderValue = 1});

  SliderState copyWith({double? sliderValue}) {
    return SliderState(sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  List<Object?> get props => [sliderValue];
}
