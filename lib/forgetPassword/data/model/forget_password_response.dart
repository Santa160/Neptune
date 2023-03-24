import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  ForgetPasswordResponse({
    required this.status,
    required this.msg,
  });

  /// A necessary factory constructor for creating a new ForgetPasswordResponse instance
  /// from a map. Pass the map to the generated `_$ForgetPasswordResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ForgetPasswordResponse.
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ForgetPasswordResponseToJson`.
  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
  final bool status;
  final String? msg;
}
