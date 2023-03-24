// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_doc_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycDocResponse _$KycDocResponseFromJson(Map<String, dynamic> json) =>
    KycDocResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$KycDocResponseToJson(KycDocResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
