import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/forgetPassword/example.dart';

import '../../../core/error/error.dart';
import '../../../service/service.dart';

class ForgetPasswordRepo {
  final ForgetPasswordService forgetPasswordService;

  ForgetPasswordRepo({required this.forgetPasswordService});
  Future<ForgetPasswordResponse> forgetPasswordRepo(
      {required String email, required String memberID}) async {
    final a = await forgetPasswordService.getForgetPassword(body: {
      "email": email,
      "memberId": memberID,
    });

    logger.e({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });
    if (!a.isSuccessful) {
      final errorResponse =
          ErrorResponse.fromJson(a.error as Map<String, dynamic>);

      if (a.statusCode == 403) {
        showErrorHUD(title: errorResponse.msg);
        throw UnauthorizeException(msg: errorResponse.msg);
      }

      throw ForgetErrorResponse(status: a.body!.status, msg: errorResponse.msg);
    }

    final res = a.body!;

    logger.d(res.toJson());
    return res;
  }

  Future<ForgetOptVerifyResponse> optVerifyRepo(String otp) async {
    final a =
        await forgetPasswordService.getOptForgetPassword(body: {"otp": otp});
    logger.e({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });

    if (!a.isSuccessful) {
      final errorResponse =
          ErrorResponse.fromJson(a.error as Map<String, dynamic>);
      if (a.statusCode == 400) {
        showErrorHUD(title: errorResponse.msg);
        throw UnauthorizeException(msg: errorResponse.status.toString());
      }
      throw ForgetErrorResponse(status: a.body!.status, msg: errorResponse.msg);
    }
    final res = a.body!;
    return res;
  }

  Future<PasswordChangeResponse> changePasswordRepo(
      {required String oldPassword, required String newPassword}) async {
    final a = await forgetPasswordService.getChangePassword(
        body: {"oldPassword": oldPassword, "newPassword": newPassword});
    logger.e({
      'body': a.body.toString(),
      'error': a.error.toString(),
      'statusCode': a.statusCode.toString(),
    });
    if (!a.isSuccessful) {
      final errorResponse =
          ErrorResponseMessage.fromJson(a.error as Map<String, dynamic>);

      if (a.statusCode == 400) {
        showErrorHUD(title: errorResponse.message);
        throw UnauthorizeException(msg: errorResponse.message);
      }
      throw ForgetErrorResponse(
          status: a.body!.status, msg: errorResponse.message);
    }
    final res = a.body!;
    logger.d(res.toJson());
    return res;
  }
}
