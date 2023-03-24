// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PromotionService extends PromotionService {
  _$PromotionService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PromotionService;

  @override
  Future<Response<PromotionModel>> getPromotion() {
    final Uri $url = Uri.parse('/api/promotions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PromotionModel, PromotionModel>($request);
  }

  @override
  Future<Response<PromotionOfferModels>> getPromotionOffer() {
    final Uri $url = Uri.parse('/api/promotions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PromotionOfferModels, PromotionOfferModels>($request);
  }
}
