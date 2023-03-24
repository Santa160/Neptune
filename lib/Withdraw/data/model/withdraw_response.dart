import 'package:json_annotation/json_annotation.dart';
part 'withdraw_response.g.dart';

@JsonSerializable()
class WithDrawResponse {
  WithDrawResponse({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new WithDrawResponse instance
  /// from a map. Pass the map to the generated `_$WithDrawResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, WithDrawResponse.
  factory WithDrawResponse.fromJson(Map<String, dynamic> json) =>
      _$WithDrawResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$WithDrawResponseToJson`.
  Map<String, dynamic> toJson() => _$WithDrawResponseToJson(this);
  final bool success;
  final String message;
}
