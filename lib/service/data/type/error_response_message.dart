import 'package:json_annotation/json_annotation.dart';

part 'error_response_message.g.dart';

@JsonSerializable()
class ErrorResponseMessage {
  ErrorResponseMessage({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  /// A necessary factory constructor for creating a new ErrorResponseMessage instance
  /// from a map. Pass the map to the generated `_$ErrorResponseMessageFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ErrorResponseMessage.
  factory ErrorResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseMessageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ErrorResponseMessageToJson`.
  Map<String, dynamic> toJson() => _$ErrorResponseMessageToJson(this);
}
