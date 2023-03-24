// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMemberResponse _$AddMemberResponseFromJson(Map<String, dynamic> json) =>
    AddMemberResponse(
      json['message'] as String?,
      success: json['success'] as bool,
      name: json['name'] as String,
      left: json['left'] as bool,
      right: json['right'] as bool,
    );

Map<String, dynamic> _$AddMemberResponseToJson(AddMemberResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'name': instance.name,
      'left': instance.left,
      'right': instance.right,
      'message': instance.message,
    };
