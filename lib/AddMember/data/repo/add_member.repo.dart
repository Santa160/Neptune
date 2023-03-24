import 'package:Neptune/AddMember/example.dart';
import 'package:Neptune/core/error/error.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/service/chopper_service/addMember/add_member.service.dart';

import '../../../Promotion/example.dart';

class AddMemberRepo {
  final AddMemberService addMemberService;

  AddMemberRepo(this.addMemberService);
  Future<MemberCheckResponse> memberCheckRepo() async {
    final a = await addMemberService.checkMember();
    logger.i({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });
    if (!a.isSuccessful) {
      throw ErrorResponseException(
          Success: a.body!.success, message: a.body.toString());
    } else if (a.body == null) {
      throw Error();
    }
    final resp = a.body!;
    logger.d(resp.toJson());

    return resp;
  }

  Future<AddMemberResponse> addMemberRepo({required String id}) async {
    final r = await addMemberService.getSponsorship(id: id);
    logger.i({
      {
        'body': r.body.toString(),
        'error': r.error.toString(),
        'statusCode': r.statusCode.toString(),
      }
    });
    if (!r.isSuccessful) {
      throw ErrorResponseException(
          Success: r.body!.success, message: r.body.toString());
    }
    final res = r.body!;
    logger.d(res.toJson());

    return res;
  }

  Future<CreateMemberResponse> createMemberRepo(
      {required String sponsorId,
      required String position,
      required String unit,
      required String name,
      required String email,
      required String phone}) async {
    final r = await addMemberService.createMember(
        sponsorId: sponsorId,
        position: position,
        unit: unit,
        name: name,
        email: email,
        phone: phone);
    logger.i({
      {
        'body': r.body.toString(),
        'error': r.error.toString(),
        'statusCode': r.statusCode.toString(),
      }
    });
    if (!r.isSuccessful) {
      throw ErrorResponseException(
          Success: r.body!.success, message: r.body.toString());
    }
    final res = r.body!;
    logger.d(res.toJson());

    return res;
  }

  Future<CreateMemberListModel> addMemberListRepo() async {
    final r = await addMemberService.getMemberList();
    logger.i({
      {
        'body': r.body.toString(),
        'error': r.error.toString(),
        'statusCode': r.statusCode.toString(),
      }
    });

    if (!r.isSuccessful) {
      throw ErrorResponseExcept(
        Success: r.body!.success,
        message: r.body!.message ?? '',
      );
    }
    final res = r.body!;
    logger.d(res.toJson());

    return res;
  }

  Future<AddMemberOfferModel> addMemberOffRepo() async {
    final a = await addMemberService.getMemberOffer();
    logger.i({
      {
        'body': a.body.toString(),
        'error': a.error.toString(),
        'statusCode': a.statusCode.toString(),
      }
    });

    if (!a.isSuccessful) {
      throw ErrorResponseExcept(
          Success: a.body!.success, message: a.body!.message ?? '');
    }
    final res = a.body!;

    logger.d(res.toJson());
    return res;
  }
}
