// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_register.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRegisterModel _$AccountRegisterModelFromJson(
        Map<String, dynamic> json) =>
    AccountRegisterModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AccountRegisterModelToJson(
        AccountRegisterModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
