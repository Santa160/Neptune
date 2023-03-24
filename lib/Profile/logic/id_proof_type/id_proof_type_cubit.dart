import 'package:Neptune/Profile/data/model/id_proof_type.model.dart';
import 'package:Neptune/Profile/data/repo/profile.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'id_proof_type_state.dart';

class IdProofTypeCubit extends Cubit<IdProofTypeState> {
  final ProfileRepo profileRepo;
  IdProofTypeCubit({required this.profileRepo}) : super(IdProofTypeInitial()) {
    getIdProofType();
  }

  Future<void> getIdProofType() async {
    emit(IdProofTypeLoading());
    try {
      final a = await profileRepo.getIdProofType();
      emit(IdProofTypeLoaded(idProofTypeModel: a));
    } catch (error) {
      emit(IdProofTypeError(error.toString()));
    }
  }
}
