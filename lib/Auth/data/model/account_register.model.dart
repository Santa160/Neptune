import 'package:json_annotation/json_annotation.dart';
part 'account_register.model.g.dart';

@JsonSerializable()
class AccountRegisterModel {
  AccountRegisterModel({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new AccountRegisterModel instance
  /// from a map. Pass the map to the generated `_$AccountRegisterModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AccountRegisterModel.
  factory AccountRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$AccountRegisterModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AccountRegisterModelToJson`.
  Map<String, dynamic> toJson() => _$AccountRegisterModelToJson(this);
  final bool? success;
  final String? message;
}
