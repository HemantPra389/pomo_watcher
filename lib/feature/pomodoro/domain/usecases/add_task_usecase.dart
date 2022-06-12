import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository taskRepository;
  AddTaskUseCase({
    required this.taskRepository,
  });
  Future<void> addTask(TaskEntity taskEntity) async {
    return taskRepository.addTask(taskEntity);
  }
}
