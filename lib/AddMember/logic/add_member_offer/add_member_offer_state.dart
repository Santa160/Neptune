part of 'add_member_offer_cubit.dart';

class AddMemberOfferState {}

class AddMemberOfferInitial extends AddMemberOfferState {}

class AddMemberOfferLoading extends AddMemberOfferState {}

class AddMemberOfferLoaded extends AddMemberOfferState {
  final AddMemberOfferModel addMemberOfferModel;

  AddMemberOfferLoaded({required this.addMemberOfferModel});
}

class AddMemberOfferError extends AddMemberOfferState {
  final String message;

  AddMemberOfferError({required this.message});
}
