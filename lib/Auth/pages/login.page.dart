import 'package:flutter/material.dart';
import 'package:Neptune/Responsive/responsive_layout.dart';

import '../../core/core.dart';
import '../widgets/login_form.widget.widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (ResponsiveLayoutPage.isDesktop(context) ||
                ResponsiveLayoutPage.isTablet(context) ||
                ResponsiveLayoutPage.isExtraLarge(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Image.asset(
                      KImage.loginImage,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height,
                    child: const Padding(
                      padding: EdgeInsets.all(87),
                      child: LoginFormWidget(),
                    ),
                  )
                ],
              ),
            if (ResponsiveLayoutPage.isMobile(context) ||
                ResponsiveLayoutPage.isMobileLarge(context))
              const Padding(
                padding: EdgeInsets.all(87),
                child: LoginFormWidget(),
              )
          ],
        ),
      ),
    );
  }
}
