import "dart:async";
import 'package:Neptune/Transfer/data/model/transferHistory.model.dart';
import 'package:Neptune/Transfer/data/model/transfer_available_response.dart';
import 'package:Neptune/Transfer/data/model/transfer_otp_response.dart';
import 'package:Neptune/Transfer/data/model/transfer_response.dart';
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "transfer.service.chopper.dart";

@ChopperApi(baseUrl: "/api")
abstract class TransferService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static TransferService create({ChopperClient? client}) =>
      _$TransferService(client);

  @Get(path: '/members/{id}')
  Future<Response<TransferResponse>> getMemberView(
      {@Path('id') required String id});
  @Get(path: '/transfers/available')
  Future<Response<TransferAvailableResponse>> getTransferAvailable();
  @Get(path: '/transfers/sendotp')
  Future<Response<TransferSendOtpResponse>> getTransferOtpSend();

  @Post(path: '/transfers/transfer')
  @multipart
  Future<Response<TransferSendOtpResponse>> getTransfer({
    @Part("member_id") required String memberId,
    @Part("otp") required String otp,
    @Part("unit_amount") required String unit,
    @Part("account_type") required String accountType,
  });
  @Get(path: '/transfers')
  Future<Response<List<TransferHistoryModel>>> getTransferHistory({
    @Query("type") required String type,
    @Query("page") required int page,
    @Query("limit") required int limit,
  });
}
