part of 'genealogy_cubit.dart';

class GenealogyState {}

class GenealogyInitial extends GenealogyState {}

class GenealogyLoading extends GenealogyState {}

class GenealogyLoadedWithNoData extends GenealogyState {
  final GenealogyModels genealogyModels;
  final List<MemberList> memberList;
  final Graph? graph;

  GenealogyLoadedWithNoData(
      {required this.graph,
      required this.genealogyModels,
      required this.memberList});
}

class GenealogyLoaded extends GenealogyState {
  final GenealogyModels genealogyModels;
  final List<MemberList> memberList;
  final Graph? graph;

  GenealogyLoaded(
      {this.graph, required this.genealogyModels, required this.memberList});
}

class GenealogyError extends GenealogyState {
  final String message;

  GenealogyError({required this.message});
}
