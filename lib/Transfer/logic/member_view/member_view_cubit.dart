import 'package:Neptune/Transfer/data/repo/transfer.repo.dart';
import 'package:Neptune/Transfer/example.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'member_view_state.dart';

class MemberViewCubit extends Cubit<MemberViewState> {
  final TransferRepo transferRepo;
  MemberViewCubit({required this.transferRepo}) : super(MemberViewInitial());

  Future<void> getMemberView({required String id}) async {
    emit(MemberViewLoading());
    try {
      final a = await transferRepo.getTransferMemberRepo(id);

      emit(MemberViewLoaded(transferResponse: a));
    } catch (error) {
      emit(MemberViewError(error.toString()));
    }
  }

  void getRefresh(String id) async {
    emit(MemberRefresh());
    try {
      final a = await transferRepo.getTransferMemberRepo(id);

      emit(MemberViewLoaded(transferResponse: a));
    } catch (error) {
      emit(MemberViewError(error.toString()));
    }
  }
}
