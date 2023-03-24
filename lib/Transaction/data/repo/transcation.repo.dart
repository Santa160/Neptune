import 'package:Neptune/Transaction/data/model/transaction_type.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/transaction/transaction.service.dart';

class TransactionRepo {
  final TransactionService transactionService;

  TransactionRepo({required this.transactionService});

  Future<TransactionTypeModel> transactionTypeRepo() async {
    final a = await transactionService.getTransactionType();
    if (!a.isSuccessful) {
      throw ErrorException(
          statusCode: a.statusCode, message: a.body.toString());
    }
    final repo = a.body!;
    logger.d(repo.toJson());

    return repo;
  }
}
