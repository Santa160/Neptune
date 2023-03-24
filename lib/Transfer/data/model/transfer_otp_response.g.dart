// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferSendOtpResponse _$TransferSendOtpResponseFromJson(
        Map<String, dynamic> json) =>
    TransferSendOtpResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$TransferSendOtpResponseToJson(
        TransferSendOtpResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
