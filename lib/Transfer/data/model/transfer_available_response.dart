import 'package:json_annotation/json_annotation.dart';
part 'transfer_available_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransferAvailableResponse {
  TransferAvailableResponse(
      {required this.success,
      required this.ePocketTransferableAmount,
      required this.eWalletTransferableAmount,
      required this.message});

  /// A necessary factory constructor for creating a new TransferAvailableResponse instance
  /// from a map. Pass the map to the generated `_$TransferAvailableResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, TransferAvailableResponse.
  factory TransferAvailableResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferAvailableResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TransferAvailableResponseToJson`.
  Map<String, dynamic> toJson() => _$TransferAvailableResponseToJson(this);
  final bool success;
  final int? ePocketTransferableAmount;
  final int? eWalletTransferableAmount;
  final String? message;
}
