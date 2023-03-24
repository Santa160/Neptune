// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ForgetPasswordService extends ForgetPasswordService {
  _$ForgetPasswordService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ForgetPasswordService;

  @override
  Future<Response<ForgetPasswordResponse>> getForgetPassword(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/sites/forgotpassword');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ForgetPasswordResponse, ForgetPasswordResponse>($request);
  }

  @override
  Future<Response<ForgetOptVerifyResponse>> getOptForgetPassword(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/sites/otpverify');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<ForgetOptVerifyResponse, ForgetOptVerifyResponse>($request);
  }

  @override
  Future<Response<PasswordResetResponse>> getResetPassword(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/sites/setpassword');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PasswordResetResponse, PasswordResetResponse>($request);
  }

  @override
  Future<Response<PasswordChangeResponse>> getChangePassword(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/sites/changepassword');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<PasswordChangeResponse, PasswordChangeResponse>($request);
  }
}
