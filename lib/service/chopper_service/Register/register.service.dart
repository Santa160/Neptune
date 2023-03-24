import "dart:async";

import 'package:chopper/chopper.dart';

import '../../../Auth/example.dart';

// This is necessary for the generator to work.
part "register.service.chopper.dart";

@ChopperApi(baseUrl: "/api/members")
abstract class RegisterService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static RegisterService create({ChopperClient? client}) =>
      _$RegisterService(client);

  @Get(path: '/check')
  Future<Response<SponsorshipModel>> getSponsorship({
    @Query("id") required String id,
  });
  @Post(path: '/verify')
  Future<Response<SponsorVerifyModel>> getSponsorVerify({
    @Body() required Map<String, dynamic> body,
  });
  @Post(path: '/register')
  Future<Response<AccountRegisterModel>> getAccountRegister({
    @Body() required Map<String, dynamic> body,
  });
}
