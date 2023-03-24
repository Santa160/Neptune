// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../Auth/example.dart' as _i3;
import '../core/flow/authentication_flow/authentication.flow.dart' as _i1;
import '../forgetPassword/example.dart' as _i2;
import 'sidebar.router.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthenticationFlowRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticationFlowPage(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ForgetPasswordPage(),
      );
    },
    OtpPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<OtpPasswordRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.OtpPasswordPage(
          key: args.key,
          token: args.token,
        ),
      );
    },
    PasswordResetRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordResetRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.PasswordResetPage(
          key: args.key,
          token: args.token,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    SideBarRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SideBarPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          AuthenticationFlowRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              LoginRoute.name,
              path: 'Login',
              parent: AuthenticationFlowRoute.name,
            ),
            _i5.RouteConfig(
              SideBarRoute.name,
              path: 'DashBoard',
              parent: AuthenticationFlowRoute.name,
            ),
          ],
        ),
        _i5.RouteConfig(
          ForgetPasswordRoute.name,
          path: 'ForgetPassword',
        ),
        _i5.RouteConfig(
          OtpPasswordRoute.name,
          path: 'OtpPasswordPage',
        ),
        _i5.RouteConfig(
          PasswordResetRoute.name,
          path: 'PasswordResetPage',
        ),
      ];
}

/// generated route for
/// [_i1.AuthenticationFlowPage]
class AuthenticationFlowRoute extends _i5.PageRouteInfo<void> {
  const AuthenticationFlowRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthenticationFlowRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthenticationFlowRoute';
}

/// generated route for
/// [_i2.ForgetPasswordPage]
class ForgetPasswordRoute extends _i5.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: 'ForgetPassword',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i2.OtpPasswordPage]
class OtpPasswordRoute extends _i5.PageRouteInfo<OtpPasswordRouteArgs> {
  OtpPasswordRoute({
    _i6.Key? key,
    required String token,
  }) : super(
          OtpPasswordRoute.name,
          path: 'OtpPasswordPage',
          args: OtpPasswordRouteArgs(
            key: key,
            token: token,
          ),
        );

  static const String name = 'OtpPasswordRoute';
}

class OtpPasswordRouteArgs {
  const OtpPasswordRouteArgs({
    this.key,
    required this.token,
  });

  final _i6.Key? key;

  final String token;

  @override
  String toString() {
    return 'OtpPasswordRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i2.PasswordResetPage]
class PasswordResetRoute extends _i5.PageRouteInfo<PasswordResetRouteArgs> {
  PasswordResetRoute({
    _i6.Key? key,
    required String token,
  }) : super(
          PasswordResetRoute.name,
          path: 'PasswordResetPage',
          args: PasswordResetRouteArgs(
            key: key,
            token: token,
          ),
        );

  static const String name = 'PasswordResetRoute';
}

class PasswordResetRouteArgs {
  const PasswordResetRouteArgs({
    this.key,
    required this.token,
  });

  final _i6.Key? key;

  final String token;

  @override
  String toString() {
    return 'PasswordResetRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SideBarPage]
class SideBarRoute extends _i5.PageRouteInfo<void> {
  const SideBarRoute()
      : super(
          SideBarRoute.name,
          path: 'DashBoard',
        );

  static const String name = 'SideBarRoute';
}
