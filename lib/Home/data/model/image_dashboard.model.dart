import 'package:json_annotation/json_annotation.dart';
part 'image_dashboard.model.g.dart';

@JsonSerializable()
class ImageDashBoardModel {
  ImageDashBoardModel({
    required this.url,
    required this.name,
  });

  /// A necessary factory constructor for creating a new ImageDashBoardModel instance
  /// from a map. Pass the map to the generated `_$ImageDashBoardModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, ImageDashBoardModel.
  factory ImageDashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$ImageDashBoardModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ImageDashBoardModelToJson`.
  Map<String, dynamic> toJson() => _$ImageDashBoardModelToJson(this);
  final String url;
  final String name;
}
