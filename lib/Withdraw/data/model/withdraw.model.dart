import 'package:json_annotation/json_annotation.dart';
part 'withdraw.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class WithDrawModel {
  WithDrawModel({
    required this.success,
    required this.dataList,
    this.message,
  });

  /// A necessary factory constructor for creating a new WithDrawModel instance
  /// from a map. Pass the map to the generated `_$WithDrawModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, WithDrawModel.
  factory WithDrawModel.fromJson(Map<String, dynamic> json) =>
      _$WithDrawModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$WithDrawModelToJson`.
  Map<String, dynamic> toJson() => _$WithDrawModelToJson(this);
  final bool success;
  final String? message;
  final List<DataList>? dataList;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataList {
  DataList({
    required this.ticketNumber,
    required this.unit,
    required this.amountInRs,
    required this.status,
    required this.amountInDollar,
    required this.appliedDate,
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
  final String ticketNumber;
  final String unit;
  final String amountInRs;
  final String amountInDollar;
  final String status;
  final String appliedDate;
}
