// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionModel _$PromotionModelFromJson(Map<String, dynamic> json) =>
    PromotionModel(
      success: json['success'] as bool,
      dataList: (json['data_list'] as List<dynamic>?)
          ?.map((e) => DataList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PromotionModelToJson(PromotionModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data_list': instance.dataList?.map((e) => e.toJson()).toList(),
    };

DataList _$DataListFromJson(Map<String, dynamic> json) => DataList(
      name: json['name'] as String,
      dateFrom: DateTime.parse(json['date_from'] as String),
      dateTo: DateTime.parse(json['date_to'] as String),
      statusExpired: json['status_expired'] as String,
      offerUnits: (json['offer_units'] as List<dynamic>)
          .map((e) => OfferUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataListToJson(DataList instance) => <String, dynamic>{
      'name': instance.name,
      'date_from': instance.dateFrom.toIso8601String(),
      'date_to': instance.dateTo.toIso8601String(),
      'status_expired': instance.statusExpired,
      'offer_units': instance.offerUnits.map((e) => e.toJson()).toList(),
    };

OfferUnit _$OfferUnitFromJson(Map<String, dynamic> json) => OfferUnit(
      unitFrom: json['unit_from'] as int,
      unitTo: json['unit_to'] as int,
      offerUnit: json['offer_unit'] as int,
    );

Map<String, dynamic> _$OfferUnitToJson(OfferUnit instance) => <String, dynamic>{
      'unit_from': instance.unitFrom,
      'unit_to': instance.unitTo,
      'offer_unit': instance.offerUnit,
    };
