import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'member_list_state.dart';

class MemberListCubit extends Cubit<MemberListState> {
  final AddMemberRepo addMemberListRepo;
  MemberListCubit({required this.addMemberListRepo})
      : super(MemberListInitial()) {
    getMemberList();
  }

  Future<void> getMemberList() async {
    emit(MemberListLoading());
    try {
      final a = await addMemberListRepo.addMemberListRepo();

      emit(MemberListLoaded(
        createMemberListModel: a,
        memberList: a.memberDetails,
      ));
    } catch (error) {
      emit(MemberListError(message: error.toString()));
    }
  }
}
