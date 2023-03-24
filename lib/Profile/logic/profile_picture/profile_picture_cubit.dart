import 'package:Neptune/Profile/data/model/profile_picture.model.dart';
import 'package:Neptune/Profile/data/repo/profile.repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  final ProfileRepo profileRepo;
  ProfilePictureCubit({required this.profileRepo})
      : super(ProfilePictureInitial());

  Future<void> getProfilePicture() async {
    emit(ProfilePictureLoading());
    try {
      final a = await profileRepo.profilePictureRepo();

      emit(ProfilePictureLoaded(pictureModel: a));
    } catch (error) {
      emit(ProfilePictureError(message: error.toString()));
    }
  }

  void refreshProfile() async {
    emit(ProfilePictureRefresh());
    try {
      final a = await profileRepo.profilePictureRepo();

      emit(ProfilePictureLoaded(pictureModel: a));
    } catch (error) {
      emit(ProfilePictureError(message: error.toString()));
    }
  }
}
