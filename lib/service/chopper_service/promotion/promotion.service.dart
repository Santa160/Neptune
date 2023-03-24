import 'package:Neptune/AddMember/data/model/add_member_offer.model.dart';
import 'package:Neptune/Promotion/data/model/promotion.model.dart';
import 'package:Neptune/Promotion/data/model/promotion_offer.model.dart';
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "promotion.service.chopper.dart";

@ChopperApi(baseUrl: "/api/promotions")
abstract class PromotionService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static PromotionService create({ChopperClient? client}) =>
      _$PromotionService(client);

  @Get()
  Future<Response<PromotionModel>> getPromotion();
  @Get()
  Future<Response<PromotionOfferModels>> getPromotionOffer();
}
