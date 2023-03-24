part of 'promotion_cubit.dart';

class PromotionState {}

class PromotionInitial extends PromotionState {}

class PromotionLoading extends PromotionState {}

class PromotionLoaded extends PromotionState {
  final PromotionModel promotionModel;
  final List<DataList>? dataList;

  PromotionLoaded({required this.promotionModel, required this.dataList});
}

class PromotionError extends PromotionState {
  final String message;

  PromotionError({required this.message});
}
