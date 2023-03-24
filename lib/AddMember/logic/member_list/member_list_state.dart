part of 'member_list_cubit.dart';

class MemberListState {}

class MemberListInitial extends MemberListState {}

class MemberListLoading extends MemberListState {}

class MemberListLoaded extends MemberListState {
  final CreateMemberListModel? createMemberListModel;
  final List<MemberDetail>? memberList;

  MemberListLoaded(
      {required this.memberList, required this.createMemberListModel});
}

class MemberListError extends MemberListState {
  final String message;

  MemberListError({required this.message});
}
