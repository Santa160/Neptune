import 'dart:convert';

import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';

import '../../Auth/example.dart';
import '../../core/constant/constant.dart';
import '../../core/widget/input_decoration.widget.dart';

class PasswordSetWidget extends StatefulWidget {
  const PasswordSetWidget({super.key, required this.token});
  final String token;

  @override
  State<PasswordSetWidget> createState() => _PasswordSetWidgetState();
}

class _PasswordSetWidgetState extends State<PasswordSetWidget> {
  final setPasswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    setPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gapSize(35, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Image.asset(
                  KImage.logoImage,
                  height: 40,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    context.router.replace(const AuthenticationFlowRoute());
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 10,
                  ),
                  label: const Text('Back'),
                ),
              ],
            ),
            Text(
                'Set the new password for your account so you can login and access',
                style: getTextStyle(
                  18,
                  FontWeight.w500,
                  ColorManager.neptuneText,
                )),
            gapSize(20, 0),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: setPasswordController,
              textAlignVertical: TextAlignVertical.center,
              decoration: inputDecoaration(
                  hint: 'Set New Password',
                  fillColor: ColorManager.conatinerColors,
                  label: 'Set New Password'),
            ),
            gapSize(10, 0),
            ButtonWidget(
              text: 'Submit',
              onPress: () async {
                if (!formKey.currentState!.validate()) {
                  return;
                } else if (setPasswordController.text.isEmpty) {
                  return showErrorHUD(title: 'Password can\'t be empty');
                }
                formKey.currentState!.save();
                // =========================================================
                // ============================================================
                //** This is use by Dio package  */
                Dio dio = Dio();

                showLoading(title: 'Loading');

                try {
                  Response response = await dio.post(
                      'https://register.neptunetourist.com/api/sites/setpassword',
                      data: jsonEncode(
                          {"newPassword": setPasswordController.text.trim()}),
                      options: Options(headers: {
                        "Authorization": 'Bearer ${widget.token}'
                      }));
                  logger.d(response.data);
                  showSuccess(title: 'Password Changed successfully');
                  context.router.replaceAll([const AuthenticationFlowRoute()]);
                  EasyLoading.dismiss();
                } on DioError catch (error) {
                  if (error.response != null) {
                    setPasswordController.clear();
                    showErrorHUD(title: 'Fail To Create Password Reset');
                  }
                }
                // =========================================================
                // ============================================================
                //** This is Use by  Chopper package  */
                // final a = await chopper
                //     .getService<ForgetPasswordService>()
                //     .getResetPassword(body: {
                //   "newPassword": setPasswordController.text.trim()
                // });

                // if (a.isSuccessful || a.body!.status == true) {
                //   final sp = await SharedPreferences.getInstance();
                //   sp.remove("token");
                //   showSuccess(title: 'Password Changed successfully');
                //   logger.d(a.body!.toJson());
                //   context.router.replaceAll([const AuthenticationFlowRoute()]);
                // } else {
                //   showErrorHUD(title: 'Fail to  Changed Password');
                // }
              },
              height: 50,
              weight: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
