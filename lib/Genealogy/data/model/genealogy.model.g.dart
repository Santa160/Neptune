// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genealogy.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenealogyModels _$GenealogyModelsFromJson(Map<String, dynamic> json) =>
    GenealogyModels(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => NodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      edges: (json['edges'] as List<dynamic>)
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberList: (json['memberList'] as List<dynamic>)
          .map((e) => MemberList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenealogyModelsToJson(GenealogyModels instance) =>
    <String, dynamic>{
      'nodes': instance.nodes.map((e) => e.toJson()).toList(),
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'memberList': instance.memberList.map((e) => e.toJson()).toList(),
    };

Edge _$EdgeFromJson(Map<String, dynamic> json) => Edge(
      from: json['from'] as int,
      to: json['to'] as int,
    );

Map<String, dynamic> _$EdgeToJson(Edge instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

MemberList _$MemberListFromJson(Map<String, dynamic> json) => MemberList(
      memberId: json['memberId'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MemberListToJson(MemberList instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'name': instance.name,
    };

NodeModel _$NodeModelFromJson(Map<String, dynamic> json) => NodeModel(
      id: json['id'] as int,
      memberId: json['memberId'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$NodeModelToJson(NodeModel instance) => <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'name': instance.name,
      'position': instance.position,
      'img': instance.img,
    };
