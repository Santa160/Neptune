import 'package:json_annotation/json_annotation.dart';
part 'member_check_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MemberCheckResponse {
  MemberCheckResponse({
    required this.success,
    required this.message,
    required this.ePocket,
    required this.minimumOpeningUnit,
  });

  /// A necessary factory constructor for creating a new MemberCheckResponse instance
  /// from a map. Pass the map to the generated `_$MemberCheckResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, MemberCheckResponse.
  factory MemberCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberCheckResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$MemberCheckResponseToJson`.
  Map<String, dynamic> toJson() => _$MemberCheckResponseToJson(this);
  final bool success;
  final String? message;
  final int? ePocket;
  final int? minimumOpeningUnit;
}
