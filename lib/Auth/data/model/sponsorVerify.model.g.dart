// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsorVerify.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorVerifyModel _$SponsorVerifyModelFromJson(Map<String, dynamic> json) =>
    SponsorVerifyModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      token: json['token'] as String?,
      leftNode: json['left_node'] as bool?,
      rightNode: json['right_node'] as bool?,
    );

Map<String, dynamic> _$SponsorVerifyModelToJson(SponsorVerifyModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'left_node': instance.leftNode,
      'right_node': instance.rightNode,
    };
