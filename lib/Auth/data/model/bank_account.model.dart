import 'package:json_annotation/json_annotation.dart';
part 'bank_account.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BankAccountModel {
  BankAccountModel({
    required this.bankName,
    required this.ifsc,
    required this.bankBranch,
    required this.accountNo,
    required this.accountHolderName,
    required this.paymentModes,
  });

  /// A necessary factory constructor for creating a new BankAccountModel instance
  /// from a map. Pass the map to the generated `_$BankAccountModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, BankAccountModel.
  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$BankAccountModelToJson`.
  Map<String, dynamic> toJson() => _$BankAccountModelToJson(this);
  final String bankName;
  final String ifsc;
  final String bankBranch;
  final String accountNo;
  final String accountHolderName;
  final List<PaymentMode> paymentModes;
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PaymentMode {
  PaymentMode({
    required this.id,
    required this.name,
    required this.requireReceipt,
  });

  /// A necessary factory constructor for creating a new PaymentMode instance
  /// from a map. Pass the map to the generated `_$PaymentModeFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PaymentMode.
  factory PaymentMode.fromJson(Map<String, dynamic> json) =>
      _$PaymentModeFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PaymentModeToJson`.
  Map<String, dynamic> toJson() => _$PaymentModeToJson(this);
  final int id;
  final String name;
  final bool requireReceipt;
}
