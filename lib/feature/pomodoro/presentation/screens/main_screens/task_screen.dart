import 'dart:math';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime? selectedDate;

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        white: Colors.white,
        accent: Colors.pink.shade300,
        backButton: false,
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: Column(
        children: [
          Center(
              child: Image.asset(
            'asset/icons/running_clock.png',
            width: 300,
            color: Colors.pink.shade200,
          )),
          Text(
            "You have no task today!",
            style: TextStyle(
                color: Colors.pink.shade300,
                fontSize: 22,
                fontFamily: 'Ubuntu'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "click the (+) icon to add a new task",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 17,
                fontFamily: 'Ubuntu'),
          ),
        ],
      ),
    );
  }
}
