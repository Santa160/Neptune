import 'package:Neptune/Promotion/data/model/promotion.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/promotion/promotion.service.dart';

class PromotionRepo {
  final PromotionService promotionService;

  PromotionRepo({required this.promotionService});
  Future<PromotionModel> getPromotion() async {
    final a = await promotionService.getPromotion();
    logger.i({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });

    if (!a.isSuccessful) {
      throw ErrorResponseException(
          Success: a.body!.success, message: a.body!.message!);
    }
    final res = a.body!;
    logger.d(res.toJson());
    return res;
  }
}
