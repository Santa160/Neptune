import 'package:Neptune/Profile/data/model/profile_picture.model.dart';
import 'package:Neptune/Profile/example.dart';
import 'package:chopper/chopper.dart';
part 'profile_service.chopper.dart';

@ChopperApi(baseUrl: "/api")
abstract class ProfileService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static ProfileService create({ChopperClient? client}) =>
      _$ProfileService(client);
  @Get(path: '/lists')
  Future<Response<List<IdProofTypeModel>>> getIdProofTypes();
  @Get(path: '/lists/countries')
  Future<Response<List<CountryModel>>> getCountries();
  @Get(path: '/lists/states')
  Future<Response<List<StateModel>>> getState({
    @Query("country_id") required String countryId,
  });
  @Get(path: '/kycs')
  Future<Response<KycModel>> getKyc();

  @Post(path: '/kycs/documentdata')
  @multipart
  Future<Response<KycDocResponse>> getKycIdDoc({
    @Part("id_proof_type_id") required String payment,
    @Part("id_no") required String idNumber,
  });

  @Post(path: '/kycs/addressdata')
  @multipart
  Future<Response<AddressDataResponse>> getkycAddress(
    @Part("address") String address,
    @Part("landmark") String landMark,
    @Part("country_id") String county,
    @Part("state_id") String state,
    @Part("district") String district,
    @Part("pin_code") String pinCode,
  );
  @Get(path: '/members/profilepic')
  Future<Response<ProfilePictureModel>> getProfilePicture();
}
