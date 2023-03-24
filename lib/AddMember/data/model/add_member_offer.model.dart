import 'package:json_annotation/json_annotation.dart';
part 'add_member_offer.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AddMemberOfferModel {
  AddMemberOfferModel(
      {required this.success, required this.dataList, required this.message});

  /// A necessary factory constructor for creating a new AddMemberOfferModel instance
  /// from a map. Pass the map to the generated `_$AddMemberOfferModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AddMemberOfferModel.
  factory AddMemberOfferModel.fromJson(Map<String, dynamic> json) =>
      _$AddMemberOfferModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AddMemberOfferModelToJson`.
  Map<String, dynamic> toJson() => _$AddMemberOfferModelToJson(this);
  final bool success;
  final DataList? dataList;
  final String? message;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataList {
  DataList({
    required this.name,
    required this.dateFrom,
    required this.dateTo,
    required this.units,
  });

  /// A necessary factory constructor for creating a new DataList instance
  /// from a map. Pass the map to the generated `_$DataListFromJson()` constructor.
  /// The constructor is named after the source class, in this case, DataList.
  factory DataList.fromJson(Map<String, dynamic> json) =>
      _$DataListFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DataListToJson`.
  Map<String, dynamic> toJson() => _$DataListToJson(this);
  final String name;
  final DateTime dateFrom;
  final DateTime dateTo;
  final List<Unit> units;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Unit {
  Unit({
    required this.unitFrom,
    required this.unitTo,
    required this.offerUnit,
  });

  /// A necessary factory constructor for creating a new Unit instance
  /// from a map. Pass the map to the generated `_$UnitFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Unit.
  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UnitToJson`.
  Map<String, dynamic> toJson() => _$UnitToJson(this);
  final int? unitFrom;
  final int? unitTo;
  final int? offerUnit;
}
