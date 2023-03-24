import 'dart:async';
import 'dart:developer';

import 'package:Neptune/router/app_router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// all the initial setup required before running the the app add here
Future<void> initSetup() async {}

typedef BuilderType = FutureOr<Widget> Function(AppRouter, SharedPreferences);

Future<void> bootstrap(BuilderType builder) async {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await initSetup();
  final p = await SharedPreferences.getInstance();
  final appRouter = AppRouter();

  await runZonedGuarded(
    () async => runApp(await builder(appRouter, p)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
