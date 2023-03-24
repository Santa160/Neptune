import 'package:json_annotation/json_annotation.dart';
part 'id_proof_response.g.dart';

@JsonSerializable()
class IdProofResponse {
  IdProofResponse({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new IdProofResponse instance
  /// from a map. Pass the map to the generated `_$IdProofResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, IdProofResponse.
  factory IdProofResponse.fromJson(Map<String, dynamic> json) =>
      _$IdProofResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$IdProofResponseToJson`.
  Map<String, dynamic> toJson() => _$IdProofResponseToJson(this);
  final bool success;
  final String message;
}
