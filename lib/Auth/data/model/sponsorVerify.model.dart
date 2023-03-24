import 'package:json_annotation/json_annotation.dart';
part 'sponsorVerify.model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class SponsorVerifyModel {
  SponsorVerifyModel({
    required this.success,
    required this.message,
    required this.token,
    required this.leftNode,
    required this.rightNode,
  });

  /// A necessary factory constructor for creating a new SponsorVerifyModel instance
  /// from a map. Pass the map to the generated `_$SponsorVerifyModelFromJson()` constructor.
  /// The constructor is named after the source class, in required this case, SponsorVerifyModel.
  factory SponsorVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorVerifyModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$SponsorVerifyModelToJson`.
  Map<String, dynamic> toJson() => _$SponsorVerifyModelToJson(this);
  final bool success;
  final String message;
  final String? token;
  final bool? leftNode;
  final bool? rightNode;
}
