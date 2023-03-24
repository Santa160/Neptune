// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member_offer.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMemberOfferModel _$AddMemberOfferModelFromJson(Map<String, dynamic> json) =>
    AddMemberOfferModel(
      success: json['success'] as bool,
      dataList: json['data_list'] == null
          ? null
          : DataList.fromJson(json['data_list'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddMemberOfferModelToJson(
        AddMemberOfferModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data_list': instance.dataList?.toJson(),
      'message': instance.message,
    };

DataList _$DataListFromJson(Map<String, dynamic> json) => DataList(
      name: json['name'] as String,
      dateFrom: DateTime.parse(json['date_from'] as String),
      dateTo: DateTime.parse(json['date_to'] as String),
      units: (json['units'] as List<dynamic>)
          .map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'name': instance.name,
      'date_from': instance.dateFrom.toIso8601String(),
      'date_to': instance.dateTo.toIso8601String(),
      'units': instance.units.map((e) => e.toJson()).toList(),
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      unitFrom: json['unit_from'] as int?,
      unitTo: json['unit_to'] as int?,
      offerUnit: json['offer_unit'] as int?,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'unit_from': instance.unitFrom,
      'unit_to': instance.unitTo,
      'offer_unit': instance.offerUnit,
    };
