// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_check_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberCheckResponse _$MemberCheckResponseFromJson(Map<String, dynamic> json) =>
    MemberCheckResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      ePocket: json['e_pocket'] as int?,
      minimumOpeningUnit: json['minimum_opening_unit'] as int?,
    );

Map<String, dynamic> _$MemberCheckResponseToJson(
        MemberCheckResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'e_pocket': instance.ePocket,
      'minimum_opening_unit': instance.minimumOpeningUnit,
    };
