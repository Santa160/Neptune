import 'package:Neptune/Home/data/model/image_dashboard.model.dart';
import 'package:Neptune/Home/data/model/dashboard.model.dart';
import 'package:chopper/chopper.dart';
part "dashboard.service.chopper.dart";

@ChopperApi(baseUrl: "/api")
abstract class DashBoardService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static DashBoardService create({ChopperClient? client}) =>
      _$DashBoardService(client);

  @Get(path: '/members/dashboard')
  Future<Response<DashboardModel>> getDashBoard();
  @Get(path: '/dashboards')
  Future<Response<List<ImageDashBoardModel>>> getDashBoardImage();
}
