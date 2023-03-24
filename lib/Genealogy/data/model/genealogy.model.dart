import 'package:json_annotation/json_annotation.dart';
part 'genealogy.model.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class GenealogyModels {
  GenealogyModels({
    required this.nodes,
    required this.edges,
    required this.memberList,
  });

  /// A necessary factory constructor for creating a new GenealogyModels instance
  /// from a map. Pass the map to the generated `_$GenealogyModelsFromJson()` constructor.
  /// The constructor is named after the source class, in this case, GenealogyModels.
  factory GenealogyModels.fromJson(Map<String, dynamic> json) =>
      _$GenealogyModelsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$GenealogyModelsToJson`.
  Map<String, dynamic> toJson() => _$GenealogyModelsToJson(this);
  final List<NodeModel> nodes;
  final List<Edge> edges;
  final List<MemberList> memberList;
}

@JsonSerializable(
  explicitToJson: true,
)
class Edge {
  Edge({
    required this.from,
    required this.to,
  });

  /// A necessary factory constructor for creating a new Edge instance
  /// from a map. Pass the map to the generated `_$EdgeFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Edge.
  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EdgeToJson`.
  Map<String, dynamic> toJson() => _$EdgeToJson(this);
  final int from;
  final int to;
}

@JsonSerializable(
  explicitToJson: true,
)
class MemberList {
  MemberList({
    required this.memberId,
    required this.name,
  });

  /// A necessary factory constructor for creating a new MemberList instance
  /// from a map. Pass the map to the generated `_$MemberListFromJson()` constructor.
  /// The constructor is named after the source class, in this case, MemberList.
  factory MemberList.fromJson(Map<String, dynamic> json) =>
      _$MemberListFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$MemberListToJson`.
  Map<String, dynamic> toJson() => _$MemberListToJson(this);
  final String memberId;
  final String name;
}

@JsonSerializable(
  explicitToJson: true,
)
class NodeModel {
  NodeModel({
    required this.id,
    required this.memberId,
    required this.name,
    required this.position,
    required this.img,
  });

  /// A necessary factory constructor for creating a new Node instance
  /// from a map. Pass the map to the generated `_$NodeFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Node.
  factory NodeModel.fromJson(Map<String, dynamic> json) =>
      _$NodeModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$NodeToJson`.
  Map<String, dynamic> toJson() => _$NodeModelToJson(this);
  final int id;
  final String memberId;
  final String name;
  final String position;
  final String img;
}
