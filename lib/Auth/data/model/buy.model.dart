import 'package:json_annotation/json_annotation.dart';
part 'buy.model.g.dart';

@JsonSerializable()
class BuyModel {
  BuyModel({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new BuyModel instance
  /// from a map. Pass the map to the generated `_$BuyModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, BuyModel.
  factory BuyModel.fromJson(Map<String, dynamic> json) =>
      _$BuyModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$BuyModelToJson`.
  Map<String, dynamic> toJson() => _$BuyModelToJson(this);
  final bool success;
  final String message;
}
