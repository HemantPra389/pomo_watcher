import 'package:flutter/material.dart';

class TaskEntity {
  int id;
  String task_title;
  DateTime date;
  DateTime timeOfDay;
  String category;
  int wrk_session;
  int long_break;
  int short_break;
  TaskEntity({
    required this.id,
    required this.task_title,
    required this.date,
    required this.timeOfDay,
    required this.category,
    required this.wrk_session,
    required this.long_break,
    required this.short_break,
  });
}
