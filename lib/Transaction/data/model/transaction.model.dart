import 'package:json_annotation/json_annotation.dart';
part 'transaction.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionModels {
  TransactionModels({
    required this.memberName,
    required this.memberId,
    required this.typeId,
    required this.debitUnit,
    required this.creditUnit,
    required this.accountType,
    required this.description,
    required this.transactionDate,
  });

  /// A necessary factory constructor for creating a new TransactionModels instance
  /// from a map. Pass the map to the generated `_$TransactionModelsFromJson()` constructor.
  /// The constructor is named after the source class, in this case, TransactionModels.
  factory TransactionModels.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TransactionModelsToJson`.
  Map<String, dynamic> toJson() => _$TransactionModelsToJson(this);
  final String? memberName;

  final String? memberId;
  final String? typeId;
  final String? debitUnit;
  final String? creditUnit;
  final String? accountType;
  final String? description;
  final String? transactionDate;
}
