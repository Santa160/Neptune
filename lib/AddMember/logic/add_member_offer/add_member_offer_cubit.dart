import 'package:Neptune/AddMember/data/model/add_member_offer.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'add_member_offer_state.dart';

class AddMemberOfferCubit extends Cubit<AddMemberOfferState> {
  final AddMemberRepo addMemberRepo;
  AddMemberOfferCubit({required this.addMemberRepo})
      : super(AddMemberOfferInitial()) {
    addMember();
  }

  Future<void> addMember() async {
    emit(AddMemberOfferLoading());

    try {
      final a = await addMemberRepo.addMemberOffRepo();

      emit(AddMemberOfferLoaded(addMemberOfferModel: a));
    } catch (error) {
      emit(AddMemberOfferError(message: error.toString()));
    }
  }
}
