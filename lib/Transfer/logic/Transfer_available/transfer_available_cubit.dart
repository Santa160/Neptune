import 'package:Neptune/Transfer/data/model/transfer_available_response.dart';
import 'package:Neptune/Transfer/data/repo/transfer.repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'transfer_available_state.dart';

class TransferAvailableCubit extends Cubit<TransferAvailableState> {
  final TransferRepo transferRepo;
  TransferAvailableCubit({
    required this.transferRepo,
  }) : super(TransferAvailableInitial()) {
    getAvailableTransfer();
  }

  Future<void> getAvailableTransfer() async {
    emit(TransferAvailableLoading());
    try {
      final a = await transferRepo.getTransferAvailable();
      emit(TransferAvailableLoaded(transferAvailableResponse: a));
    } catch (error) {
      emit(TransferAvailableError(error.runtimeType.toString()));
    }
  }
}
