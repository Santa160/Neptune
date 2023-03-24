// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_available_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferAvailableResponse _$TransferAvailableResponseFromJson(
        Map<String, dynamic> json) =>
    TransferAvailableResponse(
      success: json['success'] as bool,
      ePocketTransferableAmount: json['e_pocket_transferable_amount'] as int?,
      eWalletTransferableAmount: json['e_wallet_transferable_amount'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TransferAvailableResponseToJson(
        TransferAvailableResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'e_pocket_transferable_amount': instance.ePocketTransferableAmount,
      'e_wallet_transferable_amount': instance.eWalletTransferableAmount,
      'message': instance.message,
    };
