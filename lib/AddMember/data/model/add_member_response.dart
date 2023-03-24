import 'package:json_annotation/json_annotation.dart';
part 'add_member_response.g.dart';

@JsonSerializable()
class AddMemberResponse {
  AddMemberResponse(
    this.message, {
    required this.success,
    required this.name,
    required this.left,
    required this.right,
  });

  /// A necessary factory constructor for creating a new AddMemberResponse instance
  /// from a map. Pass the map to the generated `_$AddMemberResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AddMemberResponse.
  factory AddMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$AddMemberResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AddMemberResponseToJson`.
  Map<String, dynamic> toJson() => _$AddMemberResponseToJson(this);
  final bool success;
  final String name;
  final bool left;
  final bool right;
  final String? message;
}
