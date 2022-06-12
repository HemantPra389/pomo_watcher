import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends TaskEntity {
  @HiveField(0)
  int id;

  @HiveField(1)
  String task_title;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  DateTime timeOfDay;

  @HiveField(4)
  String category;

  @HiveField(5)
  int wrk_session;

  @HiveField(6)
  int long_break;

  @HiveField(7)
  int short_break;
  TaskModel({
    required this.id,
    required this.task_title,
    required this.date,
    required this.timeOfDay,
    required this.category,
    required this.wrk_session,
    required this.long_break,
    required this.short_break,
  }) : super(
            id: id,
            task_title: task_title,
            date: date,
            timeOfDay: timeOfDay,
            category: category,
            wrk_session: wrk_session,
            long_break: long_break,
            short_break: short_break);
}
