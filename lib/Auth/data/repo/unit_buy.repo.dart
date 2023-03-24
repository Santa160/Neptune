import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/login/login.service.dart';

import '../../example.dart';

class UnitBuyRepo {
  final LoginService loginService;

  UnitBuyRepo(this.loginService);
  Future<UnitBoughtModel> getUnit() async {
    final r = await loginService.getUnit();
    logger.d(r.body!);

    if (!r.isSuccessful || r.body == null) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final unitResponse = r.body!;
    logger.d(unitResponse.toJson());
    return unitResponse;
  }
}
