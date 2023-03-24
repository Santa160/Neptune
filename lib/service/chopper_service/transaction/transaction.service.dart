import "dart:async";

import 'package:Neptune/Transaction/data/model/transaction.model.dart';
import 'package:Neptune/Transaction/data/model/transaction_type.model.dart';
import 'package:chopper/chopper.dart';

import '../../../Auth/example.dart';

// This is necessary for the generator to work.
part "transaction.service.chopper.dart";

@ChopperApi(baseUrl: "/api/transactions")
abstract class TransactionService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static TransactionService create({ChopperClient? client}) =>
      _$TransactionService(client);

  @Get(path: '/types')
  Future<Response<TransactionTypeModel>> getTransactionType();
  @Get()
  Future<Response<List<TransactionModels>>> getTransactionHistory({
    @Query("type_id") required int type,
    @Query("page") required int page,
    @Query("limit") required int limit,
  });
}
