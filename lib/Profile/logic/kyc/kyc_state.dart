// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'kyc_cubit.dart';

enum KycStatus { initial, loading, loaded, error, refresh }

class KycState extends Equatable {
  const KycState({
    required this.status,
    this.kycModel,
  });
  final KycStatus status;
  final KycModel? kycModel;

  @override
  List<Object?> get props => [
        status,
      ];
}
// abstract class KycState {}

// class KycInitial extends KycState {}

// class KycLoading extends KycState {}

// class KycLoaded extends KycState {
//   final KycModel kycModel;

//   KycLoaded({required this.kycModel});
// }

// class KycRefresh extends KycState {}

// class KycError extends KycState {
//   final String message;
//   KycError({
//     required this.message,
//   });
// }
