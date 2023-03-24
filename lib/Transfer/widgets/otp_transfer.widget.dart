import 'package:Neptune/Home/logic/logic.dart';
import 'package:Neptune/Transfer/logic/logic.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/transfer/transfer.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/example.dart';
import '../../Responsive/responsive_layout.dart';
import '../../core/constant/constant.dart';

class OtpTransferWidget extends StatefulWidget {
  const OtpTransferWidget({super.key});

  @override
  State<OtpTransferWidget> createState() => _OtpTransferWidgetState();
}

class _OtpTransferWidgetState extends State<OtpTransferWidget> {
  String? amountUnit;
  String? memberId;
  String? message;
  final pinController = TextEditingController();
  bool _isReset = false;
  @override
  void initState() {
    messageSponsor();
    super.initState();
  }

  void messageSponsor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      amountUnit = prefs.getString('amountUnit');
      memberId = prefs.getString('memberId');
      message = prefs.getString('message');
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapSize(10, 0),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    context.read<PageIndexCubit>().pageStatus(0);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 10,
                  ),
                  label: Text('Back')),
              gapSize(10, 0),
              Text(
                message ?? '',
                style:
                    getTextStyle(15, FontWeight.normal, ColorManager.signText),
              ),
              gapSize(10, 0),
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
                text: 'Send',
                onPress: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (pinController.text.length == 6) {
                    showLoading(title: 'Loading...');
                    final p = await chopper
                        .getService<TransferService>()
                        .getTransfer(
                            memberId: memberId!,
                            otp: pinController.text.trim(),
                            unit: amountUnit!,
                            accountType: 'e_pocket');
                    logger.d(p.body!.toJson());
                    if (p.body!.success == false) {
                      return showErrorHUD(title: p.body!.message);
                    }
                    EasyLoading.dismiss();
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            height: 280,
                            width: 491,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    KImage.check,
                                    height: 40,
                                  ),
                                  Text(
                                    'Success',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: ColorManager.neptuneText),
                                  ),
                                  Text(p.body!.message),
                                  gapSize(20, 0),
                                  ButtonWidget(
                                    text: 'OK',
                                    onPress: () {
                                      Navigator.pop(context);
                                      context
                                          .read<PageIndexCubit>()
                                          .pageStatus(0);
                                      context
                                          .read<MemberViewCubit>()
                                          .getRefresh('');
                                      context.read<DashBaordCubit>().getDash();
                                      context
                                          .read<TransferAvailableCubit>()
                                          .getAvailableTransfer();

                                      setState(() {
                                        _isReset = false;
                                      });
                                    },
                                    height: 30,
                                    weight: 143,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (pinController.text.length < 6) {
                    return showErrorHUD(title: 'Please Enter 6 digit number');
                  }
                },
                height: 59,
                weight: double.infinity,
              ),
            ],
          ),
        if (ResponsiveLayoutPage.isTablet(context) ||
            ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context))
          Padding(
            padding: const EdgeInsets.only(right: 332),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapSize(10, 0),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      context.read<PageIndexCubit>().pageStatus(0);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 10,
                    ),
                    label: Text('Back')),
                gapSize(10, 0),
                Text(
                  message ?? '',
                  style: getTextStyle(
                      15, FontWeight.normal, ColorManager.signText),
                ),
                gapSize(10, 0),
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
                  text: 'Send',
                  onPress: () async {
                    if (pinController.text.length == 6) {
                      showLoading(title: 'Loading...');
                      final p = await chopper
                          .getService<TransferService>()
                          .getTransfer(
                              memberId: memberId!,
                              otp: pinController.text.trim(),
                              unit: amountUnit!,
                              accountType: 'e_pocket');
                      logger.d(p.body!.toJson());
                      if (p.body!.success == false) {
                        return showErrorHUD(title: p.body!.message);
                      }
                      EasyLoading.dismiss();
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 280,
                              width: 491,
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      KImage.check,
                                      height: 40,
                                    ),
                                    Text(
                                      'Success',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: ColorManager.neptuneText),
                                    ),
                                    Text(p.body!.message),
                                    gapSize(20, 0),
                                    ButtonWidget(
                                      text: 'OK',
                                      onPress: () {
                                        Navigator.pop(context);
                                        context
                                            .read<PageIndexCubit>()
                                            .pageStatus(0);
                                        context
                                            .read<DashBaordCubit>()
                                            .getDash();
                                        context
                                            .read<TransferAvailableCubit>()
                                            .getAvailableTransfer();
                                      },
                                      height: 47,
                                      weight: 143,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (pinController.text.length < 6) {
                      return showErrorHUD(title: 'Please Enter 6 digit number');
                    }
                  },
                  height: 59,
                  weight: double.infinity,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
