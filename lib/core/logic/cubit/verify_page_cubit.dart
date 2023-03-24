import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_page_state.dart';

class VerifyPageCubit extends Cubit<VerifyPageState> {
  VerifyPageCubit() : super(const VerifyPageState(0));
  void kycPage(int pageIndex) {
    emit(VerifyPageState(pageIndex));
  }
}
