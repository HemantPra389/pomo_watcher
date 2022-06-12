import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomo/feature/pomodoro/domain/entities/task_entity.dart';
import 'package:pomo/feature/pomodoro/domain/usecases/delete_task_usecase.dart';
import 'package:pomo/feature/pomodoro/domain/usecases/show_all_task_usecase.dart';
import 'package:pomo/injection_container.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  Future<void> showTasks() async {
    final tasklist = await locator.call<ShowAllTaskUseCase>().showAllTask();
    emit(ShowTaskState(taskData: tasklist));
  }

  Future<void> deleteTask(int id) async {
    locator.call<DeleteTaskUseCase>().deleteTask(id);
  }
}
