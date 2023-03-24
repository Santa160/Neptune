import 'package:Neptune/forgetPassword/widgets/password_forget.widget.dart';
import 'package:flutter/material.dart';

import '../../Responsive/responsive.dart';
import '../../core/core.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
                height: MediaQuery.of(context).size.height * 0.60,
                width: 491,
                child: const Card(
                  elevation: 5,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: PasswordForgetWidget()),
                ),
              ),
            ),
          if (ResponsiveLayoutPage.isMobile(context) ||
              ResponsiveLayoutPage.isMobileLarge(context))
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: const Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PasswordForgetWidget(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
