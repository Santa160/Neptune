import 'package:Neptune/Transfer/data/repo/transfer.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'transfer_history_state.dart';

class TransferHistoryCubit extends Cubit<TransferHistoryState> {
  final TransferRepo transferRepo;
  TransferHistoryCubit({required this.transferRepo})
      : super(TransferHistoryInitial());

  Future<void> getTransactionHistory(int page, int limit) async {
    emit(TransferHistoryLoading());

    final a = await transferRepo.getTransf('to', page, limit);
    emit(TransferHistoryLoaded(transactionsHistoryModel: a));
  }
}
