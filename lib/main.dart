import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pomo/feature/pomodoro/data/models/task_model.dart';
import 'package:pomo/feature/pomodoro/presentation/bloc/home_page_bloc/cubit/home_screen_cubit.dart';
import 'feature/pomodoro/presentation/bloc/pomodoro_bloc/cubit/pomodoro_cubit.dart';
import 'feature/pomodoro/presentation/screens/create_task/create_task_screen.dart';
import 'feature/pomodoro/presentation/screens/create_task/pomodoro_screen.dart';
import 'feature/pomodoro/presentation/screens/main_screens/main_screen.dart';
import 'injection_container.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appdir = await path_provider.getApplicationDocumentsDirectory();
  await setup();
  Hive
    ..init(appdir.path)
    ..registerAdapter(TaskModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeScreenCubit homeScreenCubit = HomeScreenCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => BlocProvider.value(
              value: homeScreenCubit,
              child: MainScreen(),
            ),
        PomoDoroScreen.routename: (context) => BlocProvider(
              create: (context) => PomodoroCubit(),
              child: PomoDoroScreen(),
            ),
        CreateTaskScreen.routename: (context) => BlocProvider.value(
              value: homeScreenCubit,
              child: CreateTaskScreen(),
            )
      },
    );
  }
}
