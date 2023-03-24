import 'dart:convert';

import 'package:Neptune/Auth/example.dart';
import 'package:Neptune/core/core.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';

class OtpForgetWidget extends StatefulWidget {
  const OtpForgetWidget({
    super.key,
    required this.token,
  });
  final String token;

  @override
  State<OtpForgetWidget> createState() => _OtpForgetWidgetState();
}

class _OtpForgetWidgetState extends State<OtpForgetWidget> {
  final pinController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("OTP Token${widget.token}");
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gapSize(40, 0),
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
          Text('Enter the 6 digit code that you received on your email',
              style: getTextStyle(
                18,
                FontWeight.w500,
                ColorManager.neptuneText,
              )),
          gapSize(20, 0),
          Pinput(
            controller: pinController,
            length: 6,
            showCursor: true,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
          ),
          gapSize(10, 0),
          ButtonWidget(
            text: 'Submit',
            onPress: () async {
              if (pinController.text.length == 6) {
                // =========================================================
                // ============================================================
                //** This is use By Dio Package */
                Dio dio = Dio();

                showLoading(title: 'Loading');

                try {
                  Response response = await dio.post(
                      'https://register.neptunetourist.com/api/sites/otpverify',
                      data: jsonEncode({"otp": pinController.text.trim()}),
                      options: Options(headers: {
                        "Authorization": 'Bearer ${widget.token}'
                      }));
                  logger.d(response.data);
                  context.router.replace(
                      PasswordResetRoute(token: response.data['authKey']));
                  EasyLoading.dismiss();
                } on DioError catch (error) {
                  if (error.response != null) {
                    pinController.clear();
                    showErrorHUD(title: 'Invalid OTP');
                  }
                }
                // =========================================================
                // ============================================================
                //** This is use By Chopper Package */
                // context
                //     .read<ForgetPasswordCubit>()
                //     .otpVerify(otp: pinController.text.trim());
              } else if (pinController.text.length < 6) {
                showErrorHUD(title: 'Please Enter 6 digit number');
              }
            },
            height: 50,
            weight: 380,
          )
        ],
      ),
    );
  }
}
