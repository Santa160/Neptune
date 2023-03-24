import 'package:Neptune/Promotion/data/model/promotion.model.dart';
import 'package:Neptune/Promotion/data/repo/promotion.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'promotion_state.dart';

class PromotionCubit extends Cubit<PromotionState> {
  final PromotionRepo promotionRepo;
  PromotionCubit({required this.promotionRepo}) : super(PromotionInitial()) {
    getPromotionList();
  }

  Future<void> getPromotionList() async {
    emit(PromotionLoading());
    try {
      final a = await promotionRepo.getPromotion();
      emit(PromotionLoaded(
        promotionModel: a,
        dataList: a.dataList,
      ));
    } catch (error) {
      emit(PromotionError(message: error.toString()));
    }
  }
}
