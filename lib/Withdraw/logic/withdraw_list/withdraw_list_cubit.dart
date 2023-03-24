import 'package:Neptune/Withdraw/data/model/withdraw.model.dart';
import 'package:Neptune/Withdraw/example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'withdraw_list_state.dart';

class WithdrawListCubit extends Cubit<WithdrawListState> {
  final WithDrawRepo withDrawRepo;
  WithdrawListCubit({required this.withDrawRepo})
      : super(WithdrawListInitial()) {
    getMemberList();
  }
  Future<void> getMemberList() async {
    emit(WithdrawListLoading());
    try {
      final a = await withDrawRepo.getWithDrawListRepo();
      emit(WithdrawListLoaded(withDrawModel: a));
    } catch (error) {
      emit(WithdrawListError(message: error.toString()));
    }
  }
}
