import 'package:flutter_bloc/flutter_bloc.dart';

import '../../example.dart';

part 'unit_buy_state.dart';

class UnitBuyCubit extends Cubit<UnitBuyState> {
  final UnitBuyRepo unitBuyRepo;
  UnitBuyCubit({required this.unitBuyRepo}) : super(InitUnitBuyState()) {
    getUnitFetch();
  }

  Future<void> getUnitFetch() async {
    emit(LoadingUnitBuyState());
    try {
      final r = await unitBuyRepo.getUnit();

      emit(LoadedUnitBuyState(unitBoughtModel: r));
    } catch (error) {
      emit(ErrorUnitBuyState(error.toString()));
    }
  }
}
