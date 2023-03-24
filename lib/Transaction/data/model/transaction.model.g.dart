// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModels _$TransactionModelsFromJson(Map<String, dynamic> json) =>
    TransactionModels(
      memberName: json['member_name'] as String?,
      memberId: json['member_id'] as String?,
      typeId: json['type_id'] as String?,
      debitUnit: json['debit_unit'] as String?,
      creditUnit: json['credit_unit'] as String?,
      accountType: json['account_type'] as String?,
      description: json['description'] as String?,
      transactionDate: json['transaction_date'] as String?,
    );

Map<String, dynamic> _$TransactionModelsToJson(TransactionModels instance) =>
    <String, dynamic>{
      'member_name': instance.memberName,
      'member_id': instance.memberId,
      'type_id': instance.typeId,
      'debit_unit': instance.debitUnit,
      'credit_unit': instance.creditUnit,
      'account_type': instance.accountType,
      'description': instance.description,
      'transaction_date': instance.transactionDate,
    };
