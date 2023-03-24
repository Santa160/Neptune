// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      success: json['success'] as bool,
      message: json['message'] as String?,
      memberId: json['member_id'] as String?,
      name: json['name'] as String?,
      sponsorId: json['sponsor_id'] as String?,
      sponsorName: json['sponsor_name'] as String?,
      uplineId: json['upline_id'] as String?,
      uplineName: json['upline_name'] as String?,
      membershipConfirmed: json['membership_confirmed'] as bool,
      kyc: json['kyc'] as bool,
      eWallet: json['e_wallet'] as int?,
      ePocket: json['e_pocket'] as int?,
      usd: (json['usd'] as num?)?.toDouble(),
      inr: json['inr'] as String?,
      matureStatus: json['mature_status'] as bool,
      matureMsg: json['mature_msg'] as String?,
      neptuneUnitConf: NeptuneUnitConf.fromJson(
          json['neptune_unit_conf'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'member_id': instance.memberId,
      'name': instance.name,
      'sponsor_id': instance.sponsorId,
      'sponsor_name': instance.sponsorName,
      'upline_id': instance.uplineId,
      'upline_name': instance.uplineName,
      'membership_confirmed': instance.membershipConfirmed,
      'kyc': instance.kyc,
      'e_wallet': instance.eWallet,
      'e_pocket': instance.ePocket,
      'usd': instance.usd,
      'inr': instance.inr,
      'mature_status': instance.matureStatus,
      'mature_msg': instance.matureMsg,
      'neptune_unit_conf': instance.neptuneUnitConf.toJson(),
    };

NeptuneUnitConf _$NeptuneUnitConfFromJson(Map<String, dynamic> json) =>
    NeptuneUnitConf(
      naptuneValue: json['naptune_value'] as String,
      dollarValue: json['dollar_value'] as String,
      naptuneInitailValue: json['naptune_initail_value'] as String,
      startTimestamp: json['start_timestamp'] as String,
      oneSecondRupee: json['one_second_rupee'] as String,
      timeDiffFromStart: json['time_diff_from_start'] as String,
    );

Map<String, dynamic> _$NeptuneUnitConfToJson(NeptuneUnitConf instance) =>
    <String, dynamic>{
      'naptune_value': instance.naptuneValue,
      'dollar_value': instance.dollarValue,
      'naptune_initail_value': instance.naptuneInitailValue,
      'start_timestamp': instance.startTimestamp,
      'one_second_rupee': instance.oneSecondRupee,
      'time_diff_from_start': instance.timeDiffFromStart,
    };
