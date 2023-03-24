import 'package:Neptune/Genealogy/data/model/genealogy.model.dart';
import 'package:Neptune/Genealogy/data/repo/genealogy.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';

part 'genealogy_state.dart';

class GenealogyCubit extends Cubit<GenealogyState> {
  final GenealogyRepo genealogyRepo;
  GenealogyCubit({required this.genealogyRepo}) : super(GenealogyInitial());
  Future<void> getGenealogy({required String id}) async {
    final Graph graph = Graph()..isTree = true;

    emit(GenealogyLoading());

    try {
      final a = await genealogyRepo.getGenealogy(id);
      if (a.edges.isNotEmpty) {
        for (var element in a.edges) {
          var fromNodeId = element.from;
          var toNodeId = element.to;
          graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
          emit(GenealogyLoaded(
              graph: graph, genealogyModels: a, memberList: a.memberList));
        }
      } else {
        emit(GenealogyLoadedWithNoData(
            graph: graph, genealogyModels: a, memberList: a.memberList));
      }

      // emit(GenealogyLoaded(genealogyModels: a));
    } catch (error) {
      emit(GenealogyError(message: error.toString()));
    }
  }
}
