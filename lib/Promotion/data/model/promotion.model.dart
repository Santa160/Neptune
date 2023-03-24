import 'package:json_annotation/json_annotation.dart';
part 'promotion.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PromotionModel {
  PromotionModel({
    required this.success,
    required this.dataList,
    required this.message,
  });

  /// A necessary factory constructor for creating a new PromotionModel instance
  /// from a map. Pass the map to the generated _$PromotionModelFromJson() constructor.
  /// The constructor is named after the source class, in this case, PromotionModel.
  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$PromotionModelToJson.
  Map<String, dynamic> toJson() => _$PromotionModelToJson(this);
  final bool success;
  final String? message;
  final List<DataList>? dataList;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataList {
  DataList({
    required this.name,
    required this.dateFrom,
    required this.dateTo,
    required this.statusExpired,
    required this.offerUnits,
  });

  /// A necessary factory constructor for creating a new DataList instance
  /// from a map. Pass the map to the generated _$DataListFromJson() constructor.
  /// The constructor is named after the source class, in this case, DataList.
  factory DataList.fromJson(Map<String, dynamic> json) =>
      _$DataListFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$DataListToJson.
  Map<String, dynamic> toJson() => _$DataListToJson(this);
  final String name;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String statusExpired;
  final List<OfferUnit> offerUnits;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class OfferUnit {
  OfferUnit({
    required this.unitFrom,
    required this.unitTo,
    required this.offerUnit,
  });

  /// A necessary factory constructor for creating a new OfferUnit instance
  /// from a map. Pass the map to the generated _$OfferUnitFromJson() constructor.
  /// The constructor is named after the source class, in this case, OfferUnit.
  factory OfferUnit.fromJson(Map<String, dynamic> json) =>
      _$OfferUnitFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$OfferUnitToJson.
  Map<String, dynamic> toJson() => _$OfferUnitToJson(this);
  final int unitFrom;
  final int unitTo;
  final int offerUnit;
}
