

import 'package:pomo/feature/pomodoro/data/datasource/local_datasource.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;
  TaskRepositoryImpl({required this.localDataSource});
  @override
  Future<void> addTask(TaskEntity taskEntity) async {
    return await localDataSource.addTask(taskEntity);
  }

  @override
  Future<void> deleteTask(int id) async {
    return await localDataSource.deleteTask(id);
  }

  @override
  Future<List<TaskEntity>> showallTask() async {
    return await localDataSource.showallTask();
  }
}
