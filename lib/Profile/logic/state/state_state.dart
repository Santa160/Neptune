part of 'state_cubit.dart';

abstract class StateState {}

class StateInitial extends StateState {}

class StateLoading extends StateState {}

class StateLoaded extends StateState {
  final List<StateModel> stateModel;
  final List? id;
  final List? name;

  StateLoaded({this.id, this.name, required this.stateModel});
}

class StateError extends StateState {
  final String message;

  StateError(this.message);
}
