import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'kyc_state.dart';

class KycCubit extends Cubit<KycState> {
  final ProfileRepo profileRepo;
  KycCubit({required this.profileRepo})
      : super(const KycState(status: KycStatus.initial)) {
    getKyc();
  }
  Future<void> getKyc() async {
    emit(const KycState(status: KycStatus.loading));
    try {
      final p = await profileRepo.getKyc();
      emit(KycState(status: KycStatus.loaded, kycModel: p));
    } catch (error) {
      emit(const KycState(status: KycStatus.error));
    }
  }

  void refreshScreen() async {
    emit(const KycState(status: KycStatus.refresh));
    try {
      final p = await profileRepo.getKyc();
      emit(KycState(status: KycStatus.loaded, kycModel: p));
    } catch (error) {
      emit(const KycState(status: KycStatus.error));
    }
  }
}
