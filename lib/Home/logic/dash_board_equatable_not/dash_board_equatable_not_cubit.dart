import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/dashboard.repo.dart';
import '../../example.dart';

part 'dash_board_equatable_not_state.dart';

class DashBoardEquatableNotCubit extends Cubit<DashBoardEquatableNotState> {
  final DashBoardRepo dashBoardRepo;
  DashBoardEquatableNotCubit({required this.dashBoardRepo})
      : super(DashBoardInitial()) {
    getDash();
  }

  Future<void> getDash() async {
    emit(DashBoardLoading());
    try {
      final r = await dashBoardRepo.dashboardRepo();
      emit(DashBoardLoaded(dashboardModel: r));
    } catch (error) {
      emit(DashBoardError(error.toString()));
    }
  }
}
