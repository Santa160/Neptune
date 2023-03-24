part of 'withdraw_list_cubit.dart';

class WithdrawListState {}

class WithdrawListInitial extends WithdrawListState {}

class WithdrawListLoading extends WithdrawListState {}

class WithdrawListLoaded extends WithdrawListState {
  final WithDrawModel withDrawModel;

  WithdrawListLoaded({required this.withDrawModel});
}

class WithdrawListError extends WithdrawListState {
  final String message;

  WithdrawListError({required this.message});
}
