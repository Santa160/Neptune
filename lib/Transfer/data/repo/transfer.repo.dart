import 'package:Neptune/Transfer/data/model/transfer_available_response.dart';
import 'package:Neptune/Transfer/example.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/transfer/transfer.service.dart';

class TransferRepo {
  final TransferService transferService;

  TransferRepo(this.transferService);
  Future<TransferAvailableResponse> getTransferAvailable() async {
    final a = await transferService.getTransferAvailable();
    if (!a.isSuccessful) {
      throw ErrorResponseException(
          Success: a.body!.success, message: a.body!.message!);
    }
    final rep = a.body!;
    logger.d(rep.toJson());
    return rep;
  }

  Future<TransferResponse> getTransferMemberRepo(String id) async {
    final a = await transferService.getMemberView(id: id);
    if (!a.isSuccessful) {
      throw ErrorException(
          statusCode: a.statusCode, message: a.error.toString());
    }
    final repo = a.body!;
    logger.d(repo.toJson());
    return repo;
  }

  Future<TransferSendOtpResponse> getTransferOTp() async {
    final a = await transferService.getTransferOtpSend();
    if (!a.isSuccessful) {
      throw ErrorResponseException(
          Success: a.body!.success, message: a.error.toString());
    }
    final repo = a.body!;
    return repo;
  }

  Future<List<TransferHistoryModel>> getTransf(
      String type, int page, int limit) async {
    final a = await transferService.getTransferHistory(
        type: type, page: page, limit: limit);
    if (!a.isSuccessful) {
      throw ErrorException(
          statusCode: a.statusCode, message: a.error.toString());
    }

    final repo = a.body!;
    logger.d(repo);
    return repo;
  }
}
