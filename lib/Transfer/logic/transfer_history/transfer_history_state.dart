part of 'transfer_history_cubit.dart';

class TransferHistoryState {}

class TransferHistoryInitial extends TransferHistoryState {}

class TransferHistoryLoading extends TransferHistoryState {}

class TransferHistoryLoaded extends TransferHistoryState {
  final List<TransferHistoryModel> transactionsHistoryModel;

  TransferHistoryLoaded({required this.transactionsHistoryModel});
}

class TransferHistoryError extends TransferHistoryState {
  final String message;

  TransferHistoryError(this.message);
}
