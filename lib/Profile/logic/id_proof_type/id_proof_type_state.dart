part of 'id_proof_type_cubit.dart';

abstract class IdProofTypeState {}

class IdProofTypeInitial extends IdProofTypeState {}

class IdProofTypeLoading extends IdProofTypeState {}

class IdProofTypeLoaded extends IdProofTypeState {
  final List<IdProofTypeModel> idProofTypeModel;

  IdProofTypeLoaded({required this.idProofTypeModel});
}

class IdProofTypeError extends IdProofTypeState {
  final String message;

  IdProofTypeError(this.message);
}
