part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  final String message = 'Initial';
  @override
  List<Object?> get props => [message];
}

class ShowTaskState extends HomeScreenState {
  final List<TaskEntity> taskData;
  ShowTaskState({required this.taskData});
  @override
  List<Object?> get props => [taskData];
}
