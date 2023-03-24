part of 'dash_baord_cubit.dart';

enum Status { initial, loading, loaded, error }

class DashBaordState extends Equatable {
  const DashBaordState({this.dashboardModel, required this.status});
  final DashboardModel? dashboardModel;
  final Status status;

  @override
  List<Object?> get props => [dashboardModel, status];
}
