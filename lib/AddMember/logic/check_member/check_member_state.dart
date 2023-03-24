part of 'check_member_cubit.dart';

class CheckMemberState {}

class CheckMemberInitial extends CheckMemberState {}

class CheckMemberLoading extends CheckMemberState {}

class CheckMemberLoaded extends CheckMemberState {
  final MemberCheckResponse memberCheckResponse;

  CheckMemberLoaded({required this.memberCheckResponse});
}

class CheckMemberRefresh extends CheckMemberState {}

class CheckMemberError extends CheckMemberState {
  final String message;

  CheckMemberError({required this.message});
}
