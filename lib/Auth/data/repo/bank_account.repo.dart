import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/login/login.service.dart';

import '../../example.dart';

class BankAccountRepo {
  final LoginService service;

  BankAccountRepo(this.service);

  Future<BankAccountModel> getBankAccount() async {
    final r = await service.getBankAccount();
    if (!r.isSuccessful || r.body == null) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final bankAccount = r.body!;
    logger.d(bankAccount.toJson());
    return bankAccount;
  }
}
