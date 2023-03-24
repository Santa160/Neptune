// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithDrawModel _$WithDrawModelFromJson(Map<String, dynamic> json) =>
    WithDrawModel(
      success: json['success'] as bool,
      dataList: (json['data_list'] as List<dynamic>?)
          ?.map((e) => DataList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WithDrawModelToJson(WithDrawModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data_list': instance.dataList?.map((e) => e.toJson()).toList(),
    };

DataList _$DataListFromJson(Map<String, dynamic> json) => DataList(
      ticketNumber: json['ticket_number'] as String,
      unit: json['unit'] as String,
      amountInRs: json['amount_in_rs'] as String,
      status: json['status'] as String,
      amountInDollar: json['amount_in_dollar'] as String,
      appliedDate: json['applied_date'] as String,
    );

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'ticket_number': instance.ticketNumber,
      'unit': instance.unit,
      'amount_in_rs': instance.amountInRs,
      'amount_in_dollar': instance.amountInDollar,
      'status': instance.status,
      'applied_date': instance.appliedDate,
    };
