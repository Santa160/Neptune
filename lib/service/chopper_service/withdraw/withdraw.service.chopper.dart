// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$WithDrawService extends WithDrawService {
  _$WithDrawService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WithDrawService;

  @override
  Future<Response<WithDrawResponse>> withDraw({
    required String unit,
    required String amount,
  }) {
    final Uri $url = Uri.parse('/api/withdraws');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'unit',
        unit,
      ),
      PartValue<String>(
        'amount_in_rs',
        amount,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<WithDrawResponse, WithDrawResponse>($request);
  }

  @override
  Future<Response<WithDrawModel>> getWithDrawHistory() {
    final Uri $url = Uri.parse('/api/withdraws');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<WithDrawModel, WithDrawModel>($request);
  }
}
