import 'package:get_it/get_it.dart';
import 'package:pomo/feature/pomodoro/domain/usecases/delete_task_usecase.dart';
import 'package:pomo/feature/pomodoro/domain/usecases/show_all_task_usecase.dart';

import 'feature/pomodoro/data/datasource/local_datasource.dart';
import 'feature/pomodoro/data/datasource/local_datasource_impl.dart';
import 'feature/pomodoro/data/repositories/task_repository_impl.dart';
import 'feature/pomodoro/domain/repositories/task_repository.dart';
import 'feature/pomodoro/domain/usecases/add_task_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //UseCase
  locator.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(taskRepository: locator()));
  locator.registerLazySingleton<ShowAllTaskUseCase>(
      () => ShowAllTaskUseCase(taskRepository: locator()));
  locator.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(taskRepository: locator()));

  //Repository
  locator.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(localDataSource: locator()));

  //DataSource
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
