import 'package:json_annotation/json_annotation.dart';
part 'create_member_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateMemberResponse {
  CreateMemberResponse({
    required this.success,
    required this.memberId,
    required this.message,
    required this.mailStatus,
  });

  /// A necessary factory constructor for creating a new CreateMemberResponse instance
  /// from a map. Pass the map to the generated _$CreateMemberResponseFromJson() constructor.
  /// The constructor is named after the source class, in this case, CreateMemberResponse.
  factory CreateMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMemberResponseFromJson(json);

  /// toJson is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method _$CreateMemberResponseToJson.
  Map<String, dynamic> toJson() => _$CreateMemberResponseToJson(this);
  final bool success;
  final String? memberId;
  final String? message;
  final bool? mailStatus;
}
