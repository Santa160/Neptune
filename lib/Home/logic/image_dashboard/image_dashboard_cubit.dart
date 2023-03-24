import 'package:Neptune/Home/data/model/image_dashboard.model.dart';
import 'package:Neptune/Home/data/repo/dashboard.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_dashboard_state.dart';

class ImageDashboardCubit extends Cubit<ImageDashboardState> {
  final DashBoardRepo dashBoardRepo;
  ImageDashboardCubit({required this.dashBoardRepo})
      : super(ImageDashboardInitial()) {
    getImageDashboard();
  }

  Future<void> getImageDashboard() async {
    emit(ImageDashboardLoading());
    try {
      final r = await dashBoardRepo.getImageDashBoard();
      emit(ImageDashboardLoaded(imageDashBoardModel: r));
    } catch (error) {
      emit(ImageDashboardError(error.toString()));
    }
  }
}
