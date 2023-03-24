import 'package:json_annotation/json_annotation.dart';
part 'kyc_doc_response.model.g.dart';

@JsonSerializable()
class KycDocResponse {
  KycDocResponse({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new KycDocResponse instance
  /// from a map. Pass the map to the generated `_$KycDocResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, KycDocResponse.
  factory KycDocResponse.fromJson(Map<String, dynamic> json) =>
      _$KycDocResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$KycDocResponseToJson`.
  Map<String, dynamic> toJson() => _$KycDocResponseToJson(this);
  final bool success;
  final String message;
}
