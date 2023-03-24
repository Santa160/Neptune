part of 'add_member_sponsor_cubit.dart';

class AddMemberSponsorState {}

class AddMemberSponsorInitial extends AddMemberSponsorState {}

class AddMemberSponsorLoading extends AddMemberSponsorState {}

class AddMemberSponsorLoaded extends AddMemberSponsorState {
  final AddMemberResponse addMemberResponse;

  AddMemberSponsorLoaded({required this.addMemberResponse});
}

class AddMemberSponsorError extends AddMemberSponsorState {
  final String message;

  AddMemberSponsorError(this.message);
}
