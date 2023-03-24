import 'package:json_annotation/json_annotation.dart';
part 'transaction_type.model.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionTypeModel {
  TransactionTypeModel({
    required this.types,
  });

  /// A necessary factory constructor for creating a new TransactionTypeModel instance
  /// from a map. Pass the map to the generated _$TransactionTypeModelFromJson() constructor.
  /// The constructor is named after the source class, in this case, TransactionTypeModel.
  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionTypeModelFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$TransactionTypeModelToJson.
  Map<String, dynamic> toJson() => _$TransactionTypeModelToJson(this);
  final List<Type> types;
}

@JsonSerializable(explicitToJson: true)
class Type {
  Type({
    required this.id,
    required this.name,
  });

  /// A necessary factory constructor for creating a new Type instance
  /// from a map. Pass the map to the generated _$TypeFromJson() constructor.
  /// The constructor is named after the source class, in this case, Type.
  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$TypeToJson.
  Map<String, dynamic> toJson() => _$TypeToJson(this);
  final int id;
  final String name;
}
