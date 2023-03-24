import 'package:Neptune/Home/data/model/dashboard.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/dashbaord/dashboard.service.dart';

import '../model/image_dashboard.model.dart';

class DashBoardRepo {
  final DashBoardService dashBoardService;

  DashBoardRepo(this.dashBoardService);
  Future<DashboardModel> dashboardRepo() async {
    final r = await dashBoardService.getDashBoard();
    logger.i({
      'body': r.body.toString(),
      'error': r.error.toString(),
      'statusCode': r.statusCode.toString(),
    });
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final repo = r.body!;
    logger.d(repo.toJson());
    return repo;
  }

  Future<List<ImageDashBoardModel>> getImageDashBoard() async {
    final r = await dashBoardService.getDashBoardImage();
    logger.i({
      'body': r.body.toString(),
      'error': r.error.toString(),
      'statusCode': r.statusCode.toString(),
    });
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final a = r.body!;
    logger.d(a);
    return a;
  }
}
