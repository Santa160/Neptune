// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycModel _$KycModelFromJson(Map<String, dynamic> json) => KycModel(
      idProofTypeId: json['id_proof_type_id'] as String?,
      idProofType: json['id_proof_type'] as String?,
      idNo: json['id_no'] as String?,
      address: json['address'] as String?,
      landmark: json['landmark'] as String?,
      countryId: json['country_id'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      stateId: json['state_id'] as String?,
      district: json['district'] as String?,
      pincode: json['pincode'] as String?,
      idProofFiles: json['id_proof_files'] as String?,
      addressProofFiles: json['address_proof_files'] as String?,
    );

Map<String, dynamic> _$KycModelToJson(KycModel instance) => <String, dynamic>{
      'id_proof_type_id': instance.idProofTypeId,
      'id_proof_type': instance.idProofType,
      'id_no': instance.idNo,
      'address': instance.address,
      'landmark': instance.landmark,
      'country_id': instance.countryId,
      'country': instance.country,
      'state': instance.state,
      'state_id': instance.stateId,
      'district': instance.district,
      'pincode': instance.pincode,
      'id_proof_files': instance.idProofFiles,
      'address_proof_files': instance.addressProofFiles,
    };
