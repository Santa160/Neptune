// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_bought.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitBoughtModel _$UnitBoughtModelFromJson(Map<String, dynamic> json) =>
    UnitBoughtModel(
      min: json['min'] as int,
      max: json['max'] as int,
      usd: (json['usd'] as num).toDouble(),
      inr: (json['inr'] as num).toDouble(),
    );

Map<String, dynamic> _$UnitBoughtModelToJson(UnitBoughtModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'usd': instance.usd,
      'inr': instance.inr,
    };
