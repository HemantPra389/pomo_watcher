part of 'pomodoro_cubit.dart';

abstract class PomodoroState extends Equatable {}

class PomodoroInitial extends PomodoroState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PomodoroTimer extends PomodoroState {
  final int timer_data;

  PomodoroTimer(this.timer_data);

  @override
  List<Object?> get props => [timer_data];
}
