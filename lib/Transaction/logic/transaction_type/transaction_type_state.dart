part of 'transaction_type_cubit.dart';

enum TransactionTypeStatus { initial, loading, loaded, error }

class TransactionTypeState extends Equatable {
  const TransactionTypeState({
    required this.status,
    this.transactionTypeModel,
    this.types,
  });
  final TransactionTypeStatus status;
  final TransactionTypeModel? transactionTypeModel;
  final List<Type>? types;

  @override
  List<Object?> get props => [
        status,
      ];
}


// class TransactionTypeState {}

// class TransactionTypeInitial extends TransactionTypeState {}

// class TransactionTypeLoading extends TransactionTypeState {}

// class TransactionTypeLoaded extends TransactionTypeState {
//   final TransactionTypeModel transactionTypeModel;
//   final List<Type> types;

//   TransactionTypeLoaded(
//       {required this.types, required this.transactionTypeModel});
// }

// class TransactionTypeError extends TransactionTypeState {
//   final String message;

//   TransactionTypeError(this.message);
// }

// class TransactionTypeRefresh extends TransactionTypeState {
//   TransactionTypeRefresh();
// }
