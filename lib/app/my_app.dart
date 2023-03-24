import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Neptune/app/multi_bloc_wrapper.dart';
import 'package:Neptune/core/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/app_router.gr.dart';
import 'multi_repository_provider.wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key, required this.appRouter, required this.sharedPreferences});
  final AppRouter appRouter;
  final SharedPreferences sharedPreferences;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProviderWrapper(
      sharedPreferences: sharedPreferences,
      child: MultiBlocWrapper(
        child: MaterialApp.router(
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: ThemeData(
              textTheme: GoogleFonts.jaldiTextTheme(
                  Theme.of(context).textTheme.apply(bodyColor: bodyTextColor))),
          debugShowCheckedModeBanner: false,
          color: ColorManager.backgroundColor,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
