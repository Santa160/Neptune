import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'bank_account_state.dart';

class BankAccountCubit extends Cubit<BankAccountState> {
  final BankAccountRepo bankAccountRepo;
  BankAccountCubit(this.bankAccountRepo) : super(InitBankAccount()) {
    getBankDetails();
  }

  Future<void> getBankDetails() async {
    emit(LoadingBankAccount());
    try {
      final r = await bankAccountRepo.getBankAccount();
      emit(LoadedBankAccount(bankAccountModel: r));
    } catch (error) {
      emit(ErrorBankAccount(error.toString()));
    }
  }
}
