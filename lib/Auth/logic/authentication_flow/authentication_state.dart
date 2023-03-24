part of 'authentication_cubit.dart';

enum AuthenticationStatus { initial, isLoggedIn, isLoggedOut }

class AuthenticationState extends Equatable {
  const AuthenticationState({
    required this.status,
  });
  final AuthenticationStatus status;

  @override
  List<Object?> get props => [
        status,
      ];
}
