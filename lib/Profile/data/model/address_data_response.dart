import 'package:json_annotation/json_annotation.dart';
part 'address_data_response.g.dart';

@JsonSerializable()
class AddressDataResponse {
  AddressDataResponse({
    required this.success,
    required this.message,
  });

  /// A necessary factory constructor for creating a new AddressDataResponse instance
  /// from a map. Pass the map to the generated `_$AddressDataResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AddressDataResponse.
  factory AddressDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressDataResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AddressDataResponseToJson`.
  Map<String, dynamic> toJson() => _$AddressDataResponseToJson(this);
  final bool success;
  final String message;
}
