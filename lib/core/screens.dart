import 'package:flutter/material.dart';
import 'package:pomo/feature/pomodoro/presentation/screens/main_screens/home_screen.dart';
import 'package:pomo/feature/pomodoro/presentation/screens/main_screens/profile_screen.dart';
import 'package:pomo/feature/pomodoro/presentation/screens/main_screens/stat_screen.dart';
import 'package:pomo/feature/pomodoro/presentation/screens/main_screens/task_screen.dart';


List<Widget> screens = [
  HomeScreen(),
  TaskScreen(),
  StatScreen(),
  ProfileScreen()
];
