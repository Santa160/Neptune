import 'package:Neptune/Profile/data/model/profile_picture.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';

import 'package:Neptune/service/chopper_service/profile/profile_service.dart';

import '../data.dart';

class ProfileRepo {
  final ProfileService profileService;

  ProfileRepo(this.profileService);
  Future<List<IdProofTypeModel>> getIdProofType() async {
    final r = await profileService.getIdProofTypes();
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.body.toString());
    }
    final response = r.body!;
    logger.v(response.toList());
    return response;
  }

  Future<List<CountryModel>> getCountry() async {
    final r = await profileService.getCountries();
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final response = r.body!;

    return response;
  }

  Future<List<StateModel>> getstate(String id) async {
    final r = await profileService.getState(countryId: id);
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final response = r.body!;

    return response;
  }

  Future<KycModel> getKyc() async {
    final r = await profileService.getKyc();
    if (!r.isSuccessful) {
      throw ErrorException(
          statusCode: r.statusCode, message: r.error.toString());
    }
    final rp = r.body!;
    logger.d(rp.toJson());
    return rp;
  }

  Future<ProfilePictureModel> profilePictureRepo() async {
    final a = await profileService.getProfilePicture();
    if (!a.isSuccessful) {
      throw ErrorException(
          statusCode: a.statusCode, message: a.body.toString());
    }

    final res = a.body!;

    logger.w(res.toJson());
    return res;
  }
}
