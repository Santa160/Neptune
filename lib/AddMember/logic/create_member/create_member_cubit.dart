import 'package:Neptune/AddMember/example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_member_state.dart';

class CreateMemberCubit extends Cubit<CreateMemberState> {
  final AddMemberRepo addMemberRepo;
  CreateMemberCubit({required this.addMemberRepo})
      : super(CreateMemberInitial());
  Future<void> createMember(
      {required String sponsorId,
      required String position,
      required String unit,
      required String name,
      required String email,
      required String phone}) async {
    emit(CreateMembeLoading());
    try {
      final a = await addMemberRepo.createMemberRepo(
          sponsorId: sponsorId,
          position: position,
          unit: unit,
          name: name,
          email: email,
          phone: phone);
      emit(CreateMemberLoaded(createMemberResponse: a));
    } catch (error) {
      emit(CreateMemberError(error.toString()));
    }
  }
}
