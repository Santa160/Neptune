part of 'dash_board_equatable_not_cubit.dart';

abstract class DashBoardEquatableNotState {}

class DashBoardInitial extends DashBoardEquatableNotState {}

class DashBoardLoading extends DashBoardEquatableNotState {}

class DashBoardLoaded extends DashBoardEquatableNotState {
  final DashboardModel dashboardModel;

  DashBoardLoaded({required this.dashboardModel});
}

class DashBoardError extends DashBoardEquatableNotState {
  final String messageError;

  DashBoardError(this.messageError);
}
