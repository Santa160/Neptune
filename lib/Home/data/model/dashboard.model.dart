import 'package:json_annotation/json_annotation.dart';
part 'dashboard.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DashboardModel {
  DashboardModel({
    required this.success,
    required this.message,
    required this.memberId,
    required this.name,
    required this.sponsorId,
    required this.sponsorName,
    required this.uplineId,
    required this.uplineName,
    required this.membershipConfirmed,
    required this.kyc,
    required this.eWallet,
    required this.ePocket,
    required this.usd,
    required this.inr,
    required this.matureStatus,
    required this.matureMsg,
    required this.neptuneUnitConf,
  });

  /// A necessary factory constructor for creating a new DashboardModel instance
  /// from a map. Pass the map to the generated `_$DashboardModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, DashboardModel.
  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DashboardModelToJson`.
  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  final bool success;
  final String? message;
  final String? memberId;
  final String? name;
  final String? sponsorId;
  final String? sponsorName;
  final String? uplineId;
  final String? uplineName;
  final bool membershipConfirmed;
  final bool kyc;
  final int? eWallet;
  final int? ePocket;
  final double? usd;
  final String? inr;
  final bool matureStatus;
  final String? matureMsg;
  final NeptuneUnitConf neptuneUnitConf;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NeptuneUnitConf {
  NeptuneUnitConf({
    required this.naptuneValue,
    required this.dollarValue,
    required this.naptuneInitailValue,
    required this.startTimestamp,
    required this.oneSecondRupee,
    required this.timeDiffFromStart,
  });

  /// A necessary factory constructor for creating a new NeptuneUnitConf instance
  /// from a map. Pass the map to the generated `_$NeptuneUnitConfFromJson()` constructor.
  /// The constructor is named after the source class, in this case, NeptuneUnitConf.
  factory NeptuneUnitConf.fromJson(Map<String, dynamic> json) =>
      _$NeptuneUnitConfFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NeptuneUnitConfToJson`.
  Map<String, dynamic> toJson() => _$NeptuneUnitConfToJson(this);
  final String naptuneValue;
  final String dollarValue;
  final String naptuneInitailValue;
  final String startTimestamp;
  final String oneSecondRupee;
  final String timeDiffFromStart;
}
