import 'package:json_annotation/json_annotation.dart';
part 'unit_bought.model.g.dart';

@JsonSerializable()
class UnitBoughtModel {
  UnitBoughtModel({
    required this.min,
    required this.max,
    required this.usd,
    required this.inr,
  });

  /// A necessary factory constructor for creating a new UnitBoughtModel instance
  /// from a map. Pass the map to the generated `_$UnitBoughtModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, UnitBoughtModel.
  factory UnitBoughtModel.fromJson(Map<String, dynamic> json) =>
      _$UnitBoughtModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UnitBoughtModelToJson`.
  Map<String, dynamic> toJson() => _$UnitBoughtModelToJson(this);
  final int min;
  final int max;
  final double usd;
  final double inr;
}
