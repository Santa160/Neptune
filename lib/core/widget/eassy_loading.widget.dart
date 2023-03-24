import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading({required String title}) {
  EasyLoading.show(status: title, maskType: EasyLoadingMaskType.black);
}

void showSuccess({required String title}) {
  EasyLoading.showSuccess(
    title,
  );
}

void showErrorHUD({required String title}) {
  EasyLoading.showError(
    title,
  );
}
