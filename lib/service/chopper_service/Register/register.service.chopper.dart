// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RegisterService extends RegisterService {
  _$RegisterService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RegisterService;

  @override
  Future<Response<SponsorshipModel>> getSponsorship({required String id}) {
    final Uri $url = Uri.parse('/api/members/check');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SponsorshipModel, SponsorshipModel>($request);
  }

  @override
  Future<Response<SponsorVerifyModel>> getSponsorVerify(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/members/verify');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SponsorVerifyModel, SponsorVerifyModel>($request);
  }

  @override
  Future<Response<AccountRegisterModel>> getAccountRegister(
      {required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/members/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AccountRegisterModel, AccountRegisterModel>($request);
  }
}
