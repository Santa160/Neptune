import 'package:Neptune/AddMember/data/model/member_check_response.dart';
import 'package:Neptune/AddMember/data/repo/add_member.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_member_state.dart';

class CheckMemberCubit extends Cubit<CheckMemberState> {
  final AddMemberRepo addMemberRepo;
  CheckMemberCubit({required this.addMemberRepo})
      : super(CheckMemberInitial()) {
    checkMember();
  }
  void checkMember() async {
    emit(CheckMemberLoading());
    try {
      final p = await addMemberRepo.memberCheckRepo();
      emit(CheckMemberLoaded(memberCheckResponse: p));
    } catch (error) {
      emit(CheckMemberError(message: error.toString()));
    }
  }

  Future<void> refresh() async {
    emit(CheckMemberRefresh());
    try {
      final p = await addMemberRepo.memberCheckRepo();
      emit(CheckMemberLoaded(memberCheckResponse: p));
    } catch (error) {
      emit(CheckMemberError(message: error.toString()));
    }
  }
}
