import 'package:Neptune/AddMember/data/model/add_member_offer.model.dart';
import 'package:Neptune/AddMember/example.dart';
import 'package:Neptune/Genealogy/data/model/genealogy.model.dart';
import 'package:Neptune/Home/data/model/image_dashboard.model.dart';

import 'package:Neptune/Home/data/model/dashboard.model.dart';
import 'package:Neptune/Profile/data/model/profile_picture.model.dart';

import 'package:Neptune/Profile/example.dart';
import 'package:Neptune/Promotion/data/model/promotion.model.dart';
import 'package:Neptune/Transaction/data/model/transaction.model.dart';
import 'package:Neptune/Transaction/data/model/transaction_type.model.dart';
import 'package:Neptune/Transfer/example.dart';
import 'package:Neptune/Withdraw/data/model/withdraw.model.dart';
import 'package:Neptune/Withdraw/data/model/withdraw_response.dart';
import 'package:Neptune/forgetPassword/data/data.dart';

import 'package:Neptune/service/service.dart';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/example.dart';
import '../core/helper/logger.dart';
import 'helper/generic_json_convertor.dart';

final chopper = ChopperClient(
  baseUrl: Uri.parse('https://register.neptunetourist.com'),
  services: [
    // Create and pass an instance of the generated service to the client
    RegisterService.create(),
    LoginService.create(),
    DashBoardService.create(),
    ProfileService.create(),
    TransferService.create(),
    AddMemberService.create(),
    WithDrawService.create(),
    GenealogyService.create(),
    PromotionService.create(),
    TransactionService.create(),
    ForgetPasswordService.create(),
  ],
  converter: GenericJsonConvertor({
    ErrorResponse: (jsonData) => ErrorResponse.fromJson(jsonData),
    ErrorResponseMessage: (jsonData) => ErrorResponse.fromJson(jsonData),
    LoginResponse: (jsonData) => LoginResponse.fromJson(jsonData),
    SponsorshipModel: (jsonData) => SponsorshipModel.fromJson(jsonData),
    SponsorVerifyModel: (jsonData) => SponsorVerifyModel.fromJson(jsonData),
    AccountRegisterModel: (jsonData) => AccountRegisterModel.fromJson(jsonData),
    UnitBoughtModel: (jsonData) => UnitBoughtModel.fromJson(jsonData),
    BankAccountModel: (jsonData) => BankAccountModel.fromJson(jsonData),
    BuyModel: (jsonData) => BuyModel.fromJson(jsonData),
    DashboardModel: (jsonData) => DashboardModel.fromJson(jsonData),
    ImageDashBoardModel: (jsonData) => ImageDashBoardModel.fromJson(jsonData),
    IdProofTypeModel: (jsonData) => IdProofTypeModel.fromJson(jsonData),
    CountryModel: (jsonData) => CountryModel.fromJson(jsonData),
    StateModel: (jsonData) => StateModel.fromJson(jsonData),
    KycModel: (jsonData) => KycModel.fromJson(jsonData),
    KycDocResponse: (jsonData) => KycDocResponse.fromJson(jsonData),
    AddressDataResponse: (jsonData) => AddressDataResponse.fromJson(jsonData),
    TransferResponse: (jsonData) => TransferResponse.fromJson(jsonData),
    TransferSendOtpResponse: (jsonData) =>
        TransferSendOtpResponse.fromJson(jsonData),
    TransferAvailableResponse: (jsonData) =>
        TransferAvailableResponse.fromJson(jsonData),
    TransferHistoryModel: (jsonData) => TransferHistoryModel.fromJson(jsonData),
    MemberCheckResponse: (jsonData) => MemberCheckResponse.fromJson(jsonData),
    AddMemberResponse: (jsonData) => AddMemberResponse.fromJson(jsonData),
    CreateMemberResponse: (jsonData) => CreateMemberResponse.fromJson(jsonData),
    CreateMemberListModel: (jsonData) =>
        CreateMemberListModel.fromJson(jsonData),
    WithDrawResponse: (jsonData) => WithDrawResponse.fromJson(jsonData),
    WithDrawModel: (jsonData) => WithDrawModel.fromJson(jsonData),
    GenealogyModels: (jsonData) => GenealogyModels.fromJson(jsonData),
    PromotionModel: (jsonData) => PromotionModel.fromJson(jsonData),
    AddMemberOfferModel: (jsonData) => AddMemberOfferModel.fromJson(jsonData),
    TransactionTypeModel: (jsonData) => TransactionTypeModel.fromJson(jsonData),
    TransactionModels: (jsonData) => TransactionModels.fromJson(jsonData),
    ProfilePictureModel: (jsonData) => ProfilePictureModel.fromJson(jsonData),
    ForgetPasswordResponse: (jsonData) =>
        ForgetPasswordResponse.fromJson(jsonData),
    ForgetOptVerifyResponse: (jsonData) =>
        ForgetOptVerifyResponse.fromJson(jsonData),
    PasswordResetResponse: (jsonData) =>
        PasswordResetResponse.fromJson(jsonData),
    PasswordChangeResponse: (jsonData) =>
        PasswordChangeResponse.fromJson(jsonData),
  }),
  errorConverter: const JsonConverter(),
  interceptors: [
    (Request request) async {
      /// This Interceptor will be called for every request
      /// and we will add the token to the header of the request if the user is logged in
      final p = await SharedPreferences.getInstance();
      final h = request.headers;
      final y = p.getString('token');
      if (y == null) {
        return request;
      }
      final r = request.copyWith(headers: {
        ...h,
        "Authorization": "Bearer ${p.getString('token')}",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, HEAD",
      });

      logger.i({"Token": "${p.getString('token')}"});
      return r;
    },
    HttpLoggingInterceptor()
  ],
);
