import 'package:json_annotation/json_annotation.dart';
part 'create_member_list.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CreateMemberListModel {
  CreateMemberListModel({
    required this.success,
    required this.memberDetails,
    required this.message,
  });

  /// A necessary factory constructor for creating a new CreateMemberListModel instance
  /// from a map. Pass the map to the generated `_$CreateMemberListModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CreateMemberListModel.
  factory CreateMemberListModel.fromJson(Map<String, dynamic> json) =>
      _$CreateMemberListModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CreateMemberListModelToJson`.
  Map<String, dynamic> toJson() => _$CreateMemberListModelToJson(this);
  final bool success;
  final String? message;
  final List<MemberDetail>? memberDetails;
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MemberDetail {
  MemberDetail({
    required this.memberId,
    required this.name,
    required this.email,
    required this.phone,
    required this.openingNeptuneUnit,
    required this.promotionUnit,
    required this.uplineMemberId,
    required this.createdDate,
  });

  /// A necessary factory constructor for creating a new MemberDetail instance
  /// from a map. Pass the map to the generated `_$MemberDetailFromJson()` constructor.
  /// The constructor is named after the source class, in this case, MemberDetail.
  factory MemberDetail.fromJson(Map<String, dynamic> json) =>
      _$MemberDetailFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$MemberDetailToJson`.
  Map<String, dynamic> toJson() => _$MemberDetailToJson(this);

  final String memberId;

  final String name;
  final String email;
  final String phone;
  final String openingNeptuneUnit;
  final String? promotionUnit;
  final String? uplineMemberId;
  final String? createdDate;
}
