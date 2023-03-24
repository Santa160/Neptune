import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_index_state.dart';

class KycPageCheck extends Cubit<KycIndexState> {
  KycPageCheck() : super(const KycIndexState(isKyc: false));
  void kycIndex(bool kyc) {
    print('Kyc $kyc');
    emit(KycIndexState(isKyc: kyc));
  }
}
