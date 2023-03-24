// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseMessage _$ErrorResponseMessageFromJson(
        Map<String, dynamic> json) =>
    ErrorResponseMessage(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorResponseMessageToJson(
        ErrorResponseMessage instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
