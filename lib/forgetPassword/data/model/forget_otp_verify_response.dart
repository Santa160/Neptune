import 'package:json_annotation/json_annotation.dart';
part 'forget_otp_verify_response.g.dart';

@JsonSerializable()
class ForgetOptVerifyResponse {
  ForgetOptVerifyResponse({
    required this.status,
    required this.msg,
    required this.authKey,
  });

  /// A necessary factory constructor for creating a new ForgetOptVerifyResponse instance
  /// from a map. Pass the map to the generated `_$ForgetOptVerifyResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ForgetOptVerifyResponse.
  factory ForgetOptVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetOptVerifyResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ForgetOptVerifyResponseToJson`.
  Map<String, dynamic> toJson() => _$ForgetOptVerifyResponseToJson(this);
  final bool status;
  final String? msg;
  final String? authKey;
}
