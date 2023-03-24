import 'package:Neptune/Withdraw/data/model/withdraw.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/withdraw/withdraw.service.dart';

class WithDrawRepo {
  final WithDrawService withDrawService;

  WithDrawRepo(this.withDrawService);
  Future<WithDrawModel> getWithDrawListRepo() async {
    final a = await withDrawService.getWithDrawHistory();
    logger.i(
      {
        {
          'body': a.body.toString(),
          'error': a.error.toString(),
          'statusCode': a.statusCode.toString(),
        }
      },
    );
    if (!a.isSuccessful) {
      throw ErrorResponseException(
          Success: a.body!.success, message: a.body!.message!);
    }
    final res = a.body!;
    logger.d(res.toJson());

    return res;
  }
}
