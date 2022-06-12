

import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskEntity taskEntity);
  Future<void> deleteTask(int id);
  Future<List<TaskEntity>> showallTask();
}
