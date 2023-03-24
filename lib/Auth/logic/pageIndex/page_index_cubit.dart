import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_index_state.dart';

class PageIndexCubit extends Cubit<PageIndexState> {
  PageIndexCubit() : super(const PageIndexState(index: 0));
  void pageStatus(int index) {
    // final newState = PageIndexState(index: newPage);
    emit(PageIndexState(index: index));
  }
}
