// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferResponse _$TransferResponseFromJson(Map<String, dynamic> json) =>
    TransferResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      memberId: json['member_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$TransferResponseToJson(TransferResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'member_id': instance.memberId,
      'name': instance.name,
      'phone': instance.phone,
    };
