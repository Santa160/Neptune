// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionTypeModel _$TransactionTypeModelFromJson(
        Map<String, dynamic> json) =>
    TransactionTypeModel(
      types: (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionTypeModelToJson(
        TransactionTypeModel instance) =>
    <String, dynamic>{
      'types': instance.types.map((e) => e.toJson()).toList(),
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
