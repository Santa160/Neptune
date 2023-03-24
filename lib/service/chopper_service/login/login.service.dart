import 'package:chopper/chopper.dart';

import '../../../Auth/example.dart';

part "login.service.chopper.dart";

@ChopperApi(baseUrl: "/api/members")
abstract class LoginService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static LoginService create({ChopperClient? client}) => _$LoginService(client);

  @Post(path: '/login')
  Future<Response<LoginResponse>> login({
    @Body() required Map<String, dynamic> body,
  });

  @Get(path: '/unit')
  Future<Response<UnitBoughtModel>> getUnit();

  @Get(path: '/bankaccount')
  Future<Response<BankAccountModel>> getBankAccount();

  @Post(path: '/buy')
  @multipart
  Future<Response<BuyModel>> uploadPhoto(
    @Part("units") double unit,
    @Part("payment_mode") int payment,
    @Part("reference_no") String? ref,
    @PartFile("receipt") Multipart? imagePath,
    @Part("amount") double amount,
  );
}
