import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';
import '../../core/core.dart';
import '../widgets/password_set.widget.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ResponsiveLayoutPage.isDesktop(context) ||
              ResponsiveLayoutPage.isExtraLarge(context) ||
              ResponsiveLayoutPage.isTablet(context))
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: 491,
                child: Card(
                  elevation: 5,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PasswordSetWidget(
                        token: token,
                      )),
                ),
              ),
            ),
          if (ResponsiveLayoutPage.isMobile(context) ||
              ResponsiveLayoutPage.isMobileLarge(context))
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PasswordSetWidget(
                    token: token,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
