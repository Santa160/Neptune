part of 'bank_account_cubit.dart';

abstract class BankAccountState {}

class InitBankAccount extends BankAccountState {}

class LoadingBankAccount extends BankAccountState {}

class LoadedBankAccount extends BankAccountState {
  final BankAccountModel bankAccountModel;

  LoadedBankAccount({required this.bankAccountModel});
}

class ErrorBankAccount extends BankAccountState {
  final String message;

  ErrorBankAccount(this.message);
}
