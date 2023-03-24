import 'package:Neptune/AddMember/example.dart';
import 'package:chopper/chopper.dart';

import '../../../Promotion/example.dart';
part "add_member.service.chopper.dart";

@ChopperApi(baseUrl: "/api/addmembers")
abstract class AddMemberService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static AddMemberService create({ChopperClient? client}) =>
      _$AddMemberService(client);

  @Get(path: '/check')
  Future<Response<MemberCheckResponse>> checkMember();
  @Get(path: '/sponsor')
  Future<Response<AddMemberResponse>> getSponsorship({
    @Query("id") required String id,
  });
  @Post()
  @multipart
  Future<Response<CreateMemberResponse>> createMember({
    @Part("sponsor_id") required String sponsorId,
    @Part("position") required String position,
    @Part("unit") required String unit,
    @Part("name") required String name,
    @Part("email") required String email,
    @Part("phone") required String phone,
  });
  @Get()
  Future<Response<CreateMemberListModel>> getMemberList();
  @Get(path: '/offers')
  Future<Response<AddMemberOfferModel>> getMemberOffer();
}
