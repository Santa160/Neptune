part of 'transfer_available_cubit.dart';

class TransferAvailableState {}

class TransferAvailableInitial extends TransferAvailableState {}

class TransferAvailableLoading extends TransferAvailableState {}

class TransferAvailableLoaded extends TransferAvailableState {
  final TransferAvailableResponse transferAvailableResponse;

  TransferAvailableLoaded({required this.transferAvailableResponse});
}

class TransferAvailableError extends TransferAvailableState {
  final String message;

  TransferAvailableError(this.message);
}
