// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DashBoardService extends DashBoardService {
  _$DashBoardService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DashBoardService;

  @override
  Future<Response<DashboardModel>> getDashBoard() {
    final Uri $url = Uri.parse('/api/members/dashboard');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashboardModel, DashboardModel>($request);
  }

  @override
  Future<Response<List<ImageDashBoardModel>>> getDashBoardImage() {
    final Uri $url = Uri.parse('/api/dashboards');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ImageDashBoardModel>, ImageDashBoardModel>($request);
  }
}
