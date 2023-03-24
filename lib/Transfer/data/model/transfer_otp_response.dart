import 'package:json_annotation/json_annotation.dart';
part 'transfer_otp_response.g.dart';

@JsonSerializable()
class TransferSendOtpResponse {
  TransferSendOtpResponse({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new TransferSendOtpResponse instance
  /// from a map. Pass the map to the generated `_$TransferSendOtpResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, TransferSendOtpResponse.
  factory TransferSendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferSendOtpResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TransferSendOtpResponseToJson`.
  Map<String, dynamic> toJson() => _$TransferSendOtpResponseToJson(this);
  final bool success;
  final String message;
}
