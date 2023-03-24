part of 'member_view_cubit.dart';

class MemberViewState {}

class MemberViewInitial extends MemberViewState {}

class MemberViewLoading extends MemberViewState {}

class MemberRefresh extends MemberViewState {}

class MemberViewLoaded extends MemberViewState {
  final TransferResponse transferResponse;

  MemberViewLoaded({required this.transferResponse});
}

class MemberViewError extends MemberViewState {
  final String message;

  MemberViewError(this.message);
}
