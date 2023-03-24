// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsorship.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorshipModel _$SponsorshipModelFromJson(Map<String, dynamic> json) =>
    SponsorshipModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$SponsorshipModelToJson(SponsorshipModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
