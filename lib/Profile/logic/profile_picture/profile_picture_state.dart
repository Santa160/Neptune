part of 'profile_picture_cubit.dart';

class ProfilePictureState {}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureLoading extends ProfilePictureState {}

class ProfilePictureLoaded extends ProfilePictureState {
  final ProfilePictureModel pictureModel;

  ProfilePictureLoaded({required this.pictureModel});
}

class ProfilePictureError extends ProfilePictureState {
  final String message;

  ProfilePictureError({required this.message});
}

class ProfilePictureRefresh extends ProfilePictureState {}
