// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetOptVerifyResponse _$ForgetOptVerifyResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetOptVerifyResponse(
      status: json['status'] as bool,
      msg: json['msg'] as String?,
      authKey: json['authKey'] as String?,
    );

Map<String, dynamic> _$ForgetOptVerifyResponseToJson(
        ForgetOptVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'authKey': instance.authKey,
    };
