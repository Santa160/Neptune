import 'package:Neptune/Transaction/data/model/transaction_type.model.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'transaction_type_state.dart';

class TransactionTypeCubit extends Cubit<TransactionTypeState> {
  final TransactionRepo transferRepo;
  TransactionTypeCubit({required this.transferRepo})
      : super(
            const TransactionTypeState(status: TransactionTypeStatus.initial)) {
    getTransaction();
  }

  Future<void> getTransaction() async {
    emit(const TransactionTypeState(status: TransactionTypeStatus.loading));
    try {
      final a = await transferRepo.transactionTypeRepo();
      emit(TransactionTypeState(
          status: TransactionTypeStatus.loaded,
          transactionTypeModel: a,
          types: a.types));
    } catch (error) {
      emit(const TransactionTypeState(status: TransactionTypeStatus.error));
    }
  }
}
