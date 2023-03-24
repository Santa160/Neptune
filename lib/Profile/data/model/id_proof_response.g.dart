// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_proof_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdProofResponse _$IdProofResponseFromJson(Map<String, dynamic> json) =>
    IdProofResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$IdProofResponseToJson(IdProofResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
