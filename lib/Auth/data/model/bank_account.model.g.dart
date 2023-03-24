// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    BankAccountModel(
      bankName: json['bank_name'] as String,
      ifsc: json['ifsc'] as String,
      bankBranch: json['bank_branch'] as String,
      accountNo: json['account_no'] as String,
      accountHolderName: json['account_holder_name'] as String,
      paymentModes: (json['payment_modes'] as List<dynamic>)
          .map((e) => PaymentMode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankAccountModelToJson(BankAccountModel instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'ifsc': instance.ifsc,
      'bank_branch': instance.bankBranch,
      'account_no': instance.accountNo,
      'account_holder_name': instance.accountHolderName,
      'payment_modes': instance.paymentModes.map((e) => e.toJson()).toList(),
    };

PaymentMode _$PaymentModeFromJson(Map<String, dynamic> json) => PaymentMode(
      id: json['id'] as int,
      name: json['name'] as String,
      requireReceipt: json['require_receipt'] as bool,
    );

Map<String, dynamic> _$PaymentModeToJson(PaymentMode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'require_receipt': instance.requireReceipt,
    };
