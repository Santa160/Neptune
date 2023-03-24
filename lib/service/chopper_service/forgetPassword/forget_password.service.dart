import 'package:Neptune/Home/data/model/image_dashboard.model.dart';
import 'package:Neptune/Home/data/model/dashboard.model.dart';
import 'package:Neptune/forgetPassword/data/model/forget_otp_verify_response.dart';
import 'package:Neptune/forgetPassword/data/model/forget_password_response.dart';
import 'package:Neptune/forgetPassword/data/model/password_change_response.dart';
import 'package:Neptune/forgetPassword/data/model/password_reset_response.dart';
import 'package:chopper/chopper.dart';
part "forget_password.service.chopper.dart";

@ChopperApi(baseUrl: "/api/sites")
abstract class ForgetPasswordService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static ForgetPasswordService create({ChopperClient? client}) =>
      _$ForgetPasswordService(client);

  @Post(path: '/forgotpassword')
  Future<Response<ForgetPasswordResponse>> getForgetPassword({
    @Body() required Map<String, dynamic> body,
  });
  @Post(path: '/otpverify')
  Future<Response<ForgetOptVerifyResponse>> getOptForgetPassword({
    @Body() required Map<String, dynamic> body,
  });
  @Post(path: '/setpassword')
  Future<Response<PasswordResetResponse>> getResetPassword({
    @Body() required Map<String, dynamic> body,
  });
  @Post(path: '/changepassword')
  Future<Response<PasswordChangeResponse>> getChangePassword({
    @Body() required Map<String, dynamic> body,
  });
}
