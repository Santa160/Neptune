import 'package:json_annotation/json_annotation.dart';
part 'profile_picture.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfilePictureModel {
  ProfilePictureModel({
    required this.status,
    required this.dataUrl,
    required this.message,
    required this.memberId,
    required this.name,
    required this.phone,
  });

  /// A necessary factory constructor for creating a new ProfilePictureModel instance
  /// from a map. Pass the map to the generated `_$ProfilePictureModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ProfilePictureModel.
  factory ProfilePictureModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePictureModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ProfilePictureModelToJson`.
  Map<String, dynamic> toJson() => _$ProfilePictureModelToJson(this);
  final bool status;
  final String? dataUrl;
  final String? message;
  final String? memberId;
  final String? name;
  final String? phone;
}
