part of 'image_dashboard_cubit.dart';

abstract class ImageDashboardState {}

class ImageDashboardInitial extends ImageDashboardState {}

class ImageDashboardLoading extends ImageDashboardState {}

class ImageDashboardLoaded extends ImageDashboardState {
  final List<ImageDashBoardModel> imageDashBoardModel;

  ImageDashboardLoaded({required this.imageDashBoardModel});
}

class ImageDashboardError extends ImageDashboardState {
  final String message;

  ImageDashboardError(this.message);
}
