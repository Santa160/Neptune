// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePictureModel _$ProfilePictureModelFromJson(Map<String, dynamic> json) =>
    ProfilePictureModel(
      status: json['status'] as bool,
      dataUrl: json['data_url'] as String?,
      message: json['message'] as String?,
      memberId: json['member_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfilePictureModelToJson(
        ProfilePictureModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data_url': instance.dataUrl,
      'message': instance.message,
      'member_id': instance.memberId,
      'name': instance.name,
      'phone': instance.phone,
    };
