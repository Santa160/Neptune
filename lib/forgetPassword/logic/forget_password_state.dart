part of 'forget_password_cubit.dart';

enum ForgetStatus { initial, loading, loaded, error, unauthorize }

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState(
      {this.passwordChangeResponse,
      this.message,
      this.forgetPasswordResponse,
      required this.forgetStatus});
  final ForgetStatus forgetStatus;
  final ForgetPasswordResponse? forgetPasswordResponse;
  final String? message;
  final PasswordChangeResponse? passwordChangeResponse;

  @override
  List<Object?> get props => [forgetStatus, forgetPasswordResponse, message];
}
