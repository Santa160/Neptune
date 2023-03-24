import 'package:json_annotation/json_annotation.dart';
part 'sponsorship.model.g.dart';

@JsonSerializable()
class SponsorshipModel {
  SponsorshipModel({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new SponsorshipModel instance
  /// from a map. Pass the map to the generated `_$SponsorshipModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, SponsorshipModel.
  factory SponsorshipModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorshipModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$SponsorshipModelToJson`.
  Map<String, dynamic> toJson() => _$SponsorshipModelToJson(this);
  final bool success;
  final String message;
}
