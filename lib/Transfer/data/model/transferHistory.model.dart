import 'package:json_annotation/json_annotation.dart';
part 'transferHistory.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransferHistoryModel {
  TransferHistoryModel({
    required this.id,
    required this.memberId,
    required this.transferUnit,
    required this.accountType,
    required this.transferDate,
    required this.memberName,
  });

  /// A necessary factory constructor for creating a new TransferHistoryModel instance
  /// from a map. Pass the map to the generated `_$TransferHistoryFromJson()` constructor.
  /// The constructor is named after the source class, in this case, TransferHistory.
  factory TransferHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransferHistoryModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TransferHistoryModelToJson`.
  Map<String, dynamic> toJson() => _$TransferHistoryModelToJson(this);
  final String? id;
  final String? memberId;
  final String? transferUnit;
  final String? accountType;
  final String transferDate;
  final String? memberName;
}
