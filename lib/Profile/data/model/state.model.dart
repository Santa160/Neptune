import 'package:json_annotation/json_annotation.dart';
part 'state.model.g.dart';

@JsonSerializable()
class StateModel {
  StateModel({
    required this.id,
    required this.name,
  });

  /// A necessary factory constructor for creating a new StateModel instance
  /// from a map. Pass the map to the generated `_$StateModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, StateModel.
  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$StateModelToJson`.
  Map<String, dynamic> toJson() => _$StateModelToJson(this);
  final String id;
  final String name;
}
