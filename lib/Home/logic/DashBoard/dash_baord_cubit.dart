import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/dashboard.model.dart';
import '../../data/repo/dashboard.repo.dart';

part 'dash_baord_state.dart';

class DashBaordCubit extends Cubit<DashBaordState> {
  final DashBoardRepo dashBoardRepo;
  DashBaordCubit({required this.dashBoardRepo})
      : super(const DashBaordState(status: Status.initial));

  Future<void> getDash() async {
    emit(const DashBaordState(status: Status.loading));
    try {
      final r = await dashBoardRepo.dashboardRepo();
      emit(DashBaordState(status: Status.loaded, dashboardModel: r));
    } catch (error) {
      emit(const DashBaordState(status: Status.error));
    }
  }
}
