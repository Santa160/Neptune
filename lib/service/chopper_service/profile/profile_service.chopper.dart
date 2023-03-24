// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ProfileService extends ProfileService {
  _$ProfileService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ProfileService;

  @override
  Future<Response<List<IdProofTypeModel>>> getIdProofTypes() {
    final Uri $url = Uri.parse('/api/lists');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<IdProofTypeModel>, IdProofTypeModel>($request);
  }

  @override
  Future<Response<List<CountryModel>>> getCountries() {
    final Uri $url = Uri.parse('/api/lists/countries');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CountryModel>, CountryModel>($request);
  }

  @override
  Future<Response<List<StateModel>>> getState({required String countryId}) {
    final Uri $url = Uri.parse('/api/lists/states');
    final Map<String, dynamic> $params = <String, dynamic>{
      'country_id': countryId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<StateModel>, StateModel>($request);
  }

  @override
  Future<Response<KycModel>> getKyc() {
    final Uri $url = Uri.parse('/api/kycs');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<KycModel, KycModel>($request);
  }

  @override
  Future<Response<KycDocResponse>> getKycIdDoc({
    required String payment,
    required String idNumber,
  }) {
    final Uri $url = Uri.parse('/api/kycs/documentdata');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'id_proof_type_id',
        payment,
      ),
      PartValue<String>(
        'id_no',
        idNumber,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<KycDocResponse, KycDocResponse>($request);
  }

  @override
  Future<Response<AddressDataResponse>> getkycAddress(
    String address,
    String landMark,
    String county,
    String state,
    String district,
    String pinCode,
  ) {
    final Uri $url = Uri.parse('/api/kycs/addressdata');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'address',
        address,
      ),
      PartValue<String>(
        'landmark',
        landMark,
      ),
      PartValue<String>(
        'country_id',
        county,
      ),
      PartValue<String>(
        'state_id',
        state,
      ),
      PartValue<String>(
        'district',
        district,
      ),
      PartValue<String>(
        'pin_code',
        pinCode,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<AddressDataResponse, AddressDataResponse>($request);
  }

  @override
  Future<Response<ProfilePictureModel>> getProfilePicture() {
    final Uri $url = Uri.parse('/api/members/profilepic');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ProfilePictureModel, ProfilePictureModel>($request);
  }
}
