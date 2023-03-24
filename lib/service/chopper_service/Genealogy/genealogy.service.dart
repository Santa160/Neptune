import 'package:Neptune/Genealogy/data/model/genealogy.model.dart';
import 'package:chopper/chopper.dart';
part "genealogy.service.chopper.dart";

@ChopperApi(baseUrl: "/api/members")
abstract class GenealogyService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static GenealogyService create({ChopperClient? client}) =>
      _$GenealogyService(client);

  @Get(path: '/geneology')
  Future<Response<GenealogyModels>> getGenealogy({
    @Query("id") required String id,
  });
}
