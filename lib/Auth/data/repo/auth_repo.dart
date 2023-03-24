import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/service/chopper_service/login/login.service.dart';

import '../../../core/error/error.dart';
import '../../example.dart';

class AuthRepo {
  final LoginService loginService;

  AuthRepo(this.loginService);

  Future<LoginResponse> login(
      {required String memberController,
      required String passwordController}) async {
    final r = await loginService.login(
        body: {'username': memberController, 'password': passwordController});
    logger.i({
      {
        'body': r.body.toString(),
        'error': r.error.toString(),
        'statusCode': r.statusCode.toString(),
      }
    });
    if (!r.isSuccessful) {
      showErrorHUD(title: r.body!.message!);
      throw ErrorResponseException(
          Success: r.body!.success!, message: r.body!.message!);
    }
    final loginResponse = r.body!;
    logger.d(loginResponse.toJson());
    return loginResponse;
  }
}
