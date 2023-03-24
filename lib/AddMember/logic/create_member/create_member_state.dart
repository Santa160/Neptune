part of 'create_member_cubit.dart';

class CreateMemberState {}

class CreateMemberInitial extends CreateMemberState {}

class CreateMembeLoading extends CreateMemberState {}

class CreateMemberLoaded extends CreateMemberState {
  final CreateMemberResponse createMemberResponse;

  CreateMemberLoaded({required this.createMemberResponse});
}

class CreateMemberError extends CreateMemberState {
  final String message;

  CreateMemberError(this.message);
}
