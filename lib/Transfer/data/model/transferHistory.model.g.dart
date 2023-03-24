// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferHistory.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferHistoryModel _$TransferHistoryModelFromJson(
        Map<String, dynamic> json) =>
    TransferHistoryModel(
      id: json['id'] as String?,
      memberId: json['member_id'] as String?,
      transferUnit: json['transfer_unit'] as String?,
      accountType: json['account_type'] as String?,
      transferDate: json['transfer_date'] as String,
      memberName: json['member_name'] as String?,
    );

Map<String, dynamic> _$TransferHistoryModelToJson(
        TransferHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'transfer_unit': instance.transferUnit,
      'account_type': instance.accountType,
      'transfer_date': instance.transferDate,
      'member_name': instance.memberName,
    };
