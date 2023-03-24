import 'package:Neptune/AddMember/data/model/add_member_response.dart';
import 'package:Neptune/AddMember/data/repo/add_member.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_member_sponsor_state.dart';

class AddMemberSponsorCubit extends Cubit<AddMemberSponsorState> {
  final AddMemberRepo addMemberRepo;
  AddMemberSponsorCubit({required this.addMemberRepo})
      : super(AddMemberSponsorInitial());

  Future<void> addMember({required String id}) async {
    emit(AddMemberSponsorLoading());
    try {
      final a = await addMemberRepo.addMemberRepo(id: id);
      emit(AddMemberSponsorLoaded(addMemberResponse: a));
    } catch (error) {
      emit(AddMemberSponsorError(error.toString()));
    }
  }
}
