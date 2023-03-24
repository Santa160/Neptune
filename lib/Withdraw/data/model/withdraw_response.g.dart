// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithDrawResponse _$WithDrawResponseFromJson(Map<String, dynamic> json) =>
    WithDrawResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$WithDrawResponseToJson(WithDrawResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
