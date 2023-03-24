import 'package:Neptune/Withdraw/data/model/withdraw.model.dart';
import 'package:Neptune/Withdraw/data/model/withdraw_response.dart';
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "withdraw.service.chopper.dart";

@ChopperApi(baseUrl: "/api/withdraws")
abstract class WithDrawService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static WithDrawService create({ChopperClient? client}) =>
      _$WithDrawService(client);

  @Post()
  @multipart
  Future<Response<WithDrawResponse>> withDraw({
    @Part("unit") required String unit,
    @Part("amount_in_rs") required String amount,
  });
  @Get()
  Future<Response<WithDrawModel>> getWithDrawHistory();
}
