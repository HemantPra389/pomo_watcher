import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/screens.dart';
import 'package:pomo/feature/pomodoro/presentation/bloc/home_page_bloc/cubit/home_screen_cubit.dart';
import 'package:pomo/feature/pomodoro/presentation/screens/create_task/create_task_screen.dart';
import 'package:pomo/feature/pomodoro/presentation/widgets/app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<String> appbartitle = ['', 'Task', 'Statistics', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appbartitle[currentIndex]),
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(CreateTaskScreen.routename);
        },
        child: Icon(
          Icons.add,
          color: Colors.pink.shade300,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink.shade300,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined), label: 'Statics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
