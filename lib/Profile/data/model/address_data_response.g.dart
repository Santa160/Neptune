// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDataResponse _$AddressDataResponseFromJson(Map<String, dynamic> json) =>
    AddressDataResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddressDataResponseToJson(
        AddressDataResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
