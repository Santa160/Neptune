import 'package:Neptune/router/router.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Auth/example.dart';

class AuthenticationFlowPage extends StatelessWidget {
  const AuthenticationFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AuthenticationCubit>().state;
    final status = s.status;

    return AutoRouter.declarative(
      routes: (context) {
        switch (status) {
          case AuthenticationStatus.isLoggedIn:
            return [const SideBarRoute()];

          case AuthenticationStatus.initial:
            return [];

          case AuthenticationStatus.isLoggedOut:
            return [const LoginRoute()];
        }
      },
    );
  }
}
