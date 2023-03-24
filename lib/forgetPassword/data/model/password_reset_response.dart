import 'package:json_annotation/json_annotation.dart';
part 'password_reset_response.g.dart';

@JsonSerializable()
class PasswordResetResponse {
  PasswordResetResponse({
    required this.status,
  });

  /// A necessary factory constructor for creating a new PasswordResetResponse instance
  /// from a map. Pass the map to the generated `_$PasswordResetResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PasswordResetResponse.
  factory PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PasswordResetResponseToJson`.
  Map<String, dynamic> toJson() => _$PasswordResetResponseToJson(this);
  final bool status;
}
