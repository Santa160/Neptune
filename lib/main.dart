import 'package:Neptune/app/my_app.dart';
import 'package:Neptune/boostrap.dart';

void main() {
  bootstrap(
      (appRoute, sp) => MyApp(appRouter: appRoute, sharedPreferences: sp));
}
