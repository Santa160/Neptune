import 'package:json_annotation/json_annotation.dart';
part 'promotion_offer.model.g.dart';

@JsonSerializable()
class PromotionOfferModels {
  PromotionOfferModels({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new PromotionOfferModels instance
  /// from a map. Pass the map to the generated `_$PromotionOfferModelsFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PromotionOfferModels.
  factory PromotionOfferModels.fromJson(Map<String, dynamic> json) =>
      _$PromotionOfferModelsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PromotionOfferModelsToJson`.
  Map<String, dynamic> toJson() => _$PromotionOfferModelsToJson(this);
  final bool success;
  final String message;
}
