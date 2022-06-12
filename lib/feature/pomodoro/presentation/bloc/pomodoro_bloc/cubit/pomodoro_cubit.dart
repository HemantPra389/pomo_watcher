import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(PomodoroInitial());
  Timer? timer;
  static const maxSeconds = 10;
  int seconds = maxSeconds;

  void startTimer() {
    seconds = 10;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        emit(PomodoroTimer(--seconds));
      }
    });
  }
}
