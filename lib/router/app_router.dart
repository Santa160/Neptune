import 'package:Neptune/router/sidebar.router.dart';
import 'package:auto_route/auto_route.dart';

import '../Auth/example.dart';
import '../core/flow/authentication_flow/authentication.flow.dart';
import '../forgetPassword/example.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: AuthenticationFlowPage,
      initial: true,
      children: [
        AutoRoute(
          path: 'Login',
          page: LoginPage,
        ),
        AutoRoute(page: SideBarPage, path: 'DashBoard'),
      ],
    ),
    // AutoRoute(
    //   page: RegisterPage,
    // ),
    // AutoRoute(
    //   page: UnitDetailsPage,
    // ),
    // AutoRoute(
    //   page: SuccessWidgetPage,
    // ),
    AutoRoute(
      page: ForgetPasswordPage,
      path: 'ForgetPassword',
    ),
    AutoRoute(
      page: OtpPasswordPage,
      path: 'OtpPasswordPage',
    ),
    AutoRoute(
      page: PasswordResetPage,
      path: 'PasswordResetPage',
    ),
  ],
)
class $AppRouter {}
