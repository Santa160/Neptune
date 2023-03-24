// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AddMemberService extends AddMemberService {
  _$AddMemberService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AddMemberService;

  @override
  Future<Response<MemberCheckResponse>> checkMember() {
    final Uri $url = Uri.parse('/api/addmembers/check');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MemberCheckResponse, MemberCheckResponse>($request);
  }

  @override
  Future<Response<AddMemberResponse>> getSponsorship({required String id}) {
    final Uri $url = Uri.parse('/api/addmembers/sponsor');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<AddMemberResponse, AddMemberResponse>($request);
  }

  @override
  Future<Response<CreateMemberResponse>> createMember({
    required String sponsorId,
    required String position,
    required String unit,
    required String name,
    required String email,
    required String phone,
  }) {
    final Uri $url = Uri.parse('/api/addmembers');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'sponsor_id',
        sponsorId,
      ),
      PartValue<String>(
        'position',
        position,
      ),
      PartValue<String>(
        'unit',
        unit,
      ),
      PartValue<String>(
        'name',
        name,
      ),
      PartValue<String>(
        'email',
        email,
      ),
      PartValue<String>(
        'phone',
        phone,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<CreateMemberResponse, CreateMemberResponse>($request);
  }

  @override
  Future<Response<CreateMemberListModel>> getMemberList() {
    final Uri $url = Uri.parse('/api/addmembers');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CreateMemberListModel, CreateMemberListModel>($request);
  }

  @override
  Future<Response<AddMemberOfferModel>> getMemberOffer() {
    final Uri $url = Uri.parse('/api/addmembers/offers');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AddMemberOfferModel, AddMemberOfferModel>($request);
  }
}
