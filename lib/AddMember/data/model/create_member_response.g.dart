// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMemberResponse _$CreateMemberResponseFromJson(
        Map<String, dynamic> json) =>
    CreateMemberResponse(
      success: json['success'] as bool,
      memberId: json['member_id'] as String?,
      message: json['message'] as String?,
      mailStatus: json['mail_status'] as bool?,
    );

Map<String, dynamic> _$CreateMemberResponseToJson(
        CreateMemberResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'member_id': instance.memberId,
      'message': instance.message,
      'mail_status': instance.mailStatus,
    };
