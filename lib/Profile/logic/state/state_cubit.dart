import 'package:Neptune/Profile/data/model/state.model.dart';
import 'package:Neptune/Profile/data/repo/profile.repo.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state_state.dart';

class StateCubit extends Cubit<StateState> {
  final ProfileRepo profileRepo;
  StateCubit({required this.profileRepo}) : super(StateInitial());
  List idList = [];
  List name = [];
  Future<void> getState(String id) async {
    emit(StateLoading());
    try {
      final a = await profileRepo.getstate(id);

      if (a.isEmpty) {
        showErrorHUD(title: 'State not Found');
      } else {
        for (int i = 0; i < a.length; i++) {
          idList.add(a[i].id);
          name.add(a[i].name);
        }
        emit(StateLoaded(stateModel: a, id: idList, name: name));
      }
    } catch (error) {
      emit(StateError(error.toString()));
    }
  }
}
