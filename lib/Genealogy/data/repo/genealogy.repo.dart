// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Neptune/Genealogy/data/model/genealogy.model.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/Genealogy/genealogy.service.dart';

class GenealogyRepo {
  final GenealogyService genealogyService;
  GenealogyRepo({
    required this.genealogyService,
  });
  Future<GenealogyModels> getGenealogy(String id) async {
    final a = await genealogyService.getGenealogy(id: id);
    logger.i({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });
    if (!a.isSuccessful) {
      throw ErrorException(
          statusCode: a.statusCode, message: a.error.toString());
    }
    final res = a.body!;

    logger.d(res.toJson());
    return res;
  }
}
