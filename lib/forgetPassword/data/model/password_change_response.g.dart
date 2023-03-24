// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_change_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordChangeResponse _$PasswordChangeResponseFromJson(
        Map<String, dynamic> json) =>
    PasswordChangeResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PasswordChangeResponseToJson(
        PasswordChangeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
