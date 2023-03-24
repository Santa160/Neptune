// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TransactionService extends TransactionService {
  _$TransactionService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TransactionService;

  @override
  Future<Response<TransactionTypeModel>> getTransactionType() {
    final Uri $url = Uri.parse('/api/transactions/types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TransactionTypeModel, TransactionTypeModel>($request);
  }

  @override
  Future<Response<List<TransactionModels>>> getTransactionHistory({
    required int type,
    required int page,
    required int limit,
  }) {
    final Uri $url = Uri.parse('/api/transactions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'type_id': type,
      'page': page,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<TransactionModels>, TransactionModels>($request);
  }
}
