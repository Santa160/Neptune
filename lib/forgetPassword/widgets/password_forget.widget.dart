import 'dart:convert';

import 'package:Neptune/Auth/example.dart';
import 'package:Neptune/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/core.dart';
import '../../core/widget/eassy_loading.widget.dart';
import '../../core/widget/input_decoration.widget.dart';

class PasswordForgetWidget extends StatefulWidget {
  const PasswordForgetWidget({super.key});

  @override
  State<PasswordForgetWidget> createState() => _PasswordForgetWidgetState();
}

class _PasswordForgetWidgetState extends State<PasswordForgetWidget> {
  final emailController = TextEditingController();
  final memberIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    memberIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gapSize(15, 0),
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
                    label: const Text('Back')),
              ],
            ),
            Text(
              "Enter your Member ID and email for verification process, We will sent you 6 digit code to your email",
              style:
                  getTextStyle(18, FontWeight.w500, ColorManager.neptuneText),
            ),
            gapSize(10, 0),
            TextFormField(
              controller: emailController,
              textAlignVertical: TextAlignVertical.center,
              decoration: inputDecoaration(
                  hint: 'Email',
                  fillColor: ColorManager.conatinerColors,
                  label: 'Email'),
            ),
            gapSize(10, 0),
            TextFormField(
              controller: memberIdController,
              textAlignVertical: TextAlignVertical.center,
              decoration: inputDecoaration(
                  hint: 'MemberID',
                  fillColor: ColorManager.conatinerColors,
                  label: 'MemberID'),
            ),
            gapSize(20, 0),
            ButtonWidget(
              text: 'Submit',
              onPress: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                } else if (emailController.text.isEmpty) {
                  return showErrorHUD(title: 'Email Can\'t be Empty');
                } else if (memberIdController.text.isEmpty) {
                  return showErrorHUD(title: 'MemberID can\'t be Empty');
                }
                _formKey.currentState!.save();
                // ================================================
                //** Using Chopper for This  */
                // context.read<ForgetPasswordCubit>().passwordForget(
                //     email: emailController.text.trim(),
                //     memberId: memberIdController.text.trim(),
                //     context: context);
                // // =========================================================
                // // ============================================================
                // //** This is use by Dio Use  */
                Dio dio = Dio();
                showLoading(title: 'Loading...');
                try {
                  Response response = await dio.post(
                    'https://register.neptunetourist.com/api/sites/forgotpasswordz',
                    data: jsonEncode({
                      "email": emailController.text.trim(),
                      "memberId": memberIdController.text.trim()
                    }),
                  );

                  emailController.clear();
                  memberIdController.clear();
                  context.router
                      .replace(OtpPasswordRoute(token: response.data['msg']));
                  EasyLoading.dismiss();
                } on DioError catch (error) {
                  if (error.response != null) {
                    emailController.clear();
                    memberIdController.clear();
                    showErrorHUD(title: error.response!.data['msg']);
                  }
                }
              },
              height: 40,
              weight: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
