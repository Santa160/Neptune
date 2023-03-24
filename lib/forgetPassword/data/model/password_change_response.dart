import 'package:json_annotation/json_annotation.dart';
part 'password_change_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PasswordChangeResponse {
  PasswordChangeResponse({
    required this.status,
    required this.message,
  });

  /// A necessary factory constructor for creating a new PasswordChangeResponse instance
  /// from a map. Pass the map to the generated `_$PasswordChangeResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PasswordChangeResponse.
  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PasswordChangeResponseToJson`.
  Map<String, dynamic> toJson() => _$PasswordChangeResponseToJson(this);
  final bool status;
  final String? message;
}
