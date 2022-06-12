import 'package:hive/hive.dart';
import 'package:pomo/feature/pomodoro/data/models/task_model.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';

import 'local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> addTask(TaskEntity taskEntity) async {
    final taskbox = await Hive.openBox('taskbox');
    final tasks = TaskModel(
        id: taskEntity.id,
        task_title: taskEntity.task_title,
        date: taskEntity.date,
        timeOfDay: taskEntity.timeOfDay,
        category: taskEntity.category,
        wrk_session: taskEntity.wrk_session,
        long_break: taskEntity.long_break,
        short_break: taskEntity.short_break);
    await taskbox.add(tasks).then((value) => print(
        "${tasks.id} ${tasks.task_title} ${tasks.date} ${tasks.timeOfDay} ${tasks.category} ${tasks.wrk_session}"));
  }

  @override
  Future<void> deleteTask(int id) async {
    final taskbox = await Hive.openBox('taskbox');
    await taskbox
        .deleteAt(id)
        .then((value) => print("$id SuccessFully Deleted"));
  }

  @override
  Future<List<TaskEntity>> showallTask() async {
    final taskbox = await Hive.openBox('taskbox');
    final taskids = taskbox.keys;
    List<TaskEntity> tasks = [];
    taskids.forEach((element) {
      tasks.add(taskbox.get(element));
    });
    return tasks;
  }
}
