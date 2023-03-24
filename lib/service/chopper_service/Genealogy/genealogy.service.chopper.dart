// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genealogy.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GenealogyService extends GenealogyService {
  _$GenealogyService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GenealogyService;

  @override
  Future<Response<GenealogyModels>> getGenealogy({required String id}) {
    final Uri $url = Uri.parse('/api/members/geneology');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<GenealogyModels, GenealogyModels>($request);
  }
}
