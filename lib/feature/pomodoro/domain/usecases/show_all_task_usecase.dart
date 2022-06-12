import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/repositories/task_repository.dart';

class ShowAllTaskUseCase {
  final TaskRepository taskRepository;
  ShowAllTaskUseCase({required this.taskRepository});
  Future<List<TaskEntity>> showAllTask() async {
    return taskRepository.showallTask();
  }
}
