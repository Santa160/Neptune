import 'package:shared_preferences/shared_preferences.dart';

class DiskRepo {
  final SharedPreferences sharedPreferences;

  DiskRepo({required this.sharedPreferences});

  String? get token => sharedPreferences.getString('msg');
  int? get accStatus => sharedPreferences.getInt('checkStatus');

  void deleteToken() {
    sharedPreferences.remove('token');
  }

  Future<void> saveToken({required String token}) async {
    await sharedPreferences.setString('token', token);
  }

  bool checkUser() {
    final r = sharedPreferences.get('token');
    if (r != null) {
      return true;
    } else {
      return false;
    }
  }
}
