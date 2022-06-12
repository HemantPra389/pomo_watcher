import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/repositories/task_repository.dart';
class DeleteTaskUseCase {
  final TaskRepository taskRepository;
  DeleteTaskUseCase({required this.taskRepository});
  Future<void> deleteTask(int id) async {
    return taskRepository.deleteTask(id);
  }
}
