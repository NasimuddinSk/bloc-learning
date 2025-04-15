import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {}

class NotificationEnableOrDisable extends SwitchEvent {
  @override
  List<Object> get props => [];
}
