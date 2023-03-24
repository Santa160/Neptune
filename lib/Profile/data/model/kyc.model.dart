import 'package:json_annotation/json_annotation.dart';
part 'kyc.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class KycModel {
  KycModel({
    required this.idProofTypeId,
    required this.idProofType,
    required this.idNo,
    required this.address,
    required this.landmark,
    required this.countryId,
    required this.country,
    required this.state,
    required this.stateId,
    required this.district,
    required this.pincode,
    required this.idProofFiles,
    required this.addressProofFiles,
  });

  /// A necessary factory constructor for creating a new KycModel instance
  /// from a map. Pass the map to the generated `_$KycModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, KycModel.
  factory KycModel.fromJson(Map<String, dynamic> json) =>
      _$KycModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$KycModelToJson`.
  Map<String, dynamic> toJson() => _$KycModelToJson(this);
  final String? idProofTypeId;
  final String? idProofType;
  final String? idNo;
  final String? address;
  final String? landmark;
  final String? countryId;
  final String? country;
  final String? state;
  final String? stateId;
  final String? district;
  final String? pincode;
  final String? idProofFiles;
  final String? addressProofFiles;
}
