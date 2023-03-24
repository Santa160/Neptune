// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TransferService extends TransferService {
  _$TransferService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TransferService;

  @override
  Future<Response<TransferResponse>> getMemberView({required String id}) {
    final Uri $url = Uri.parse('/api/members/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TransferResponse, TransferResponse>($request);
  }

  @override
  Future<Response<TransferAvailableResponse>> getTransferAvailable() {
    final Uri $url = Uri.parse('/api/transfers/available');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<TransferAvailableResponse, TransferAvailableResponse>($request);
  }

  @override
  Future<Response<TransferSendOtpResponse>> getTransferOtpSend() {
    final Uri $url = Uri.parse('/api/transfers/sendotp');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<TransferSendOtpResponse, TransferSendOtpResponse>($request);
  }

  @override
  Future<Response<TransferSendOtpResponse>> getTransfer({
    required String memberId,
    required String otp,
    required String unit,
    required String accountType,
  }) {
    final Uri $url = Uri.parse('/api/transfers/transfer');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'member_id',
        memberId,
      ),
      PartValue<String>(
        'otp',
        otp,
      ),
      PartValue<String>(
        'unit_amount',
        unit,
      ),
      PartValue<String>(
        'account_type',
        accountType,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client
        .send<TransferSendOtpResponse, TransferSendOtpResponse>($request);
  }

  @override
  Future<Response<List<TransferHistoryModel>>> getTransferHistory({
    required String type,
    required int page,
    required int limit,
  }) {
    final Uri $url = Uri.parse('/api/transfers');
    final Map<String, dynamic> $params = <String, dynamic>{
      'type': type,
      'page': page,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<List<TransferHistoryModel>, TransferHistoryModel>($request);
  }
}
