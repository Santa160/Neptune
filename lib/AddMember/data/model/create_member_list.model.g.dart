// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_member_list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMemberListModel _$CreateMemberListModelFromJson(
        Map<String, dynamic> json) =>
    CreateMemberListModel(
      success: json['success'] as bool,
      memberDetails: (json['member_details'] as List<dynamic>?)
          ?.map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateMemberListModelToJson(
        CreateMemberListModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'member_details': instance.memberDetails?.map((e) => e.toJson()).toList(),
    };

MemberDetail _$MemberDetailFromJson(Map<String, dynamic> json) => MemberDetail(
      memberId: json['member_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      openingNeptuneUnit: json['opening_neptune_unit'] as String,
      promotionUnit: json['promotion_unit'] as String?,
      uplineMemberId: json['upline_member_id'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$MemberDetailToJson(MemberDetail instance) =>
    <String, dynamic>{
      'member_id': instance.memberId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'opening_neptune_unit': instance.openingNeptuneUnit,
      'promotion_unit': instance.promotionUnit,
      'upline_member_id': instance.uplineMemberId,
      'created_date': instance.createdDate,
    };
