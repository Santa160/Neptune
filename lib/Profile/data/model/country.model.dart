import 'package:json_annotation/json_annotation.dart';
part 'country.model.g.dart';

@JsonSerializable()
class CountryModel {
  CountryModel({
    required this.id,
    required this.name,
  });

  /// A necessary factory constructor for creating a new CountryModel instance
  /// from a map. Pass the map to the generated `_$CountryModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CountryModel.
  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CountryModelToJson`.
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
  final String id;
  final String name;
}
