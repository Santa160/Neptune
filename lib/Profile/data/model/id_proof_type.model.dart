import 'package:json_annotation/json_annotation.dart';
part 'id_proof_type.model.g.dart';

@JsonSerializable()
class IdProofTypeModel {
  IdProofTypeModel({
    required this.id,
    required this.name,
  });

  /// A necessary factory constructor for creating a new IdProofTypeModel instance
  /// from a map. Pass the map to the generated `_$IdProofTypeModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, IdProofTypeModel.
  factory IdProofTypeModel.fromJson(Map<String, dynamic> json) =>
      _$IdProofTypeModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$IdProofTypeModelToJson`.
  Map<String, dynamic> toJson() => _$IdProofTypeModelToJson(this);
  final String id;
  final String name;
}
