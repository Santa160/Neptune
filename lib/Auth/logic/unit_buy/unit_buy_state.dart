// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'unit_buy_cubit.dart';

abstract class UnitBuyState {}

class InitUnitBuyState extends UnitBuyState {}

class LoadingUnitBuyState extends UnitBuyState {}

class ErrorUnitBuyState extends UnitBuyState {
  final String message;

  ErrorUnitBuyState(this.message);
}

class LoadedUnitBuyState extends UnitBuyState {
  final UnitBoughtModel unitBoughtModel;
  LoadedUnitBuyState({
    required this.unitBoughtModel,
  });
}
