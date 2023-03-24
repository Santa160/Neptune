import 'package:json_annotation/json_annotation.dart';
part 'transfer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransferResponse {
  TransferResponse({
    required this.success,
    required this.message,
    required this.memberId,
    required this.name,
    required this.phone,
  });

  /// A necessary factory constructor for creating a new TransferResponse instance
  /// from a map. Pass the map to the generated `_$TransferResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, TransferResponse.
  factory TransferResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TransferResponseToJson`.
  Map<String, dynamic> toJson() => _$TransferResponseToJson(this);
  final bool success;
  final String? message;
  final String? memberId;
  final String? name;
  final String? phone;
}
