import 'package:Neptune/Transfer/logic/logic.dart';
import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/button.widget.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/withdraw/withdraw.service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../AddMember/example.dart';
import '../../Responsive/responsive.dart';
import '../../core/core.dart';
import '../../core/widget/input_decoration.widget.dart';

class WithDrawWiget extends StatefulWidget {
  const WithDrawWiget(
      {super.key,
      required this.neptuneUnit,
      required this.rupee,
      required this.neptuneInitallValue,
      required this.startTimeStamp,
      required this.one_second_rupee,
      required this.dollar});
  final String neptuneUnit;
  final String rupee;
  final String neptuneInitallValue;
  final String startTimeStamp;
  final String one_second_rupee;
  final String dollar;

  @override
  State<WithDrawWiget> createState() => _WithDrawWigetState();
}

class _WithDrawWigetState extends State<WithDrawWiget> {
  TextEditingController unitController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double neptuneValue = 0;
  double dollar = 0;

  final bool _isReset = true;
  int _isValue = 1;

  @override
  void initState() {
    super.initState();
    context.read<CheckMemberCubit>().checkMember();
    timeStamp();
  }
//** TimeStamp For Loop only Increment */
  // void timeLife() async {
  //   String temp = '0.';
  //   List n = widget.neptuneUnit.toString().split(".");
  //   for (int i = 0; i < n[1].length; i++) {
  //     if (i == n[1].length - 1) {
  //       temp = "${temp}1";
  //     } else {
  //       temp = "${temp}0";
  //     }
  //   }
  //   double n2 = double.parse(temp);

  //   while (true) {
  //     await Future.delayed(const Duration(seconds: 1));

  //     data = data! + n2;
  //     //_isValue = data!;
  //     if (mounted) setState(() {});
  //   }
  // }
// ==============================================================
//** TimeStamp Show Second */
  void timeStamp() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      var t = DateTime.now().millisecondsSinceEpoch ~/
          Duration.microsecondsPerMillisecond;

      var e = int.parse(widget.startTimeStamp);
      var q = t - e;
      var r = double.parse(widget.one_second_rupee);
      var y = double.parse(widget.dollar);

      var p = q * r;

      var neptune = double.parse(widget.neptuneInitallValue);

      neptuneValue = neptune + p;
      dollar = neptuneValue / y;
      setState(() {});
    }
  }

  @override
  void dispose() {
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-pocket WithDrawal Request',
          style: getTextStyle(25, FontWeight.w400, ColorManager.neptuneText),
        ),
        if (ResponsiveLayoutPage.isTablet(context) ||
            ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context))
          BlocBuilder<CheckMemberCubit, CheckMemberState>(
            builder: (context, checkState) {
              if (checkState is CheckMemberInitial ||
                  checkState is CheckMemberLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (checkState is CheckMemberLoaded) {
                if (checkState.memberCheckResponse.success == false) {
                  return Text(
                    checkState.memberCheckResponse.message!,
                    style: getTextStyle(
                        15, FontWeight.bold, ColorManager.signText),
                  );
                } else if (checkState.memberCheckResponse.success == true &&
                    _isReset) {
                  //** neptune Unit multiple by UnitController */
                  var p = neptuneValue * _isValue;
                  var dollarData = dollar * _isValue;
                  return Padding(
                    padding: const EdgeInsets.only(right: 332),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Available E-pocket Units',
                                style: getTextStyle(
                                    15, FontWeight.bold, ColorManager.signText),
                              ),
                              Text(
                                "${checkState.memberCheckResponse.ePocket}U",
                                style: getTextStyle(
                                    15, FontWeight.bold, ColorManager.signText),
                              ),
                            ],
                          ),
                          gapSize(15, 0),
                          TextFormField(
                            onChanged: (v) {
                              _isValue = int.parse(v);
                              setState(() {});
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: unitController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: inputDecoaration(
                                hint: 'Units',
                                fillColor: ColorManager.conatinerColors,
                                label: 'Units'),
                          ),
                          Visibility(
                            visible: unitController.text.isNotEmpty,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${unitController.text}U = ₹ ${p.toStringAsFixed(2)} /\$ ${dollarData.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          gapSize(20, 0),
                          ButtonWidget(
                            text: 'Send',
                            onPress: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              } else if (unitController.text.isEmpty) {
                                return showErrorHUD(
                                    title: 'Unit can\t be empty');
                              } else if (checkState
                                      .memberCheckResponse.ePocket! <
                                  _isValue) {
                                return showErrorHUD(
                                    title:
                                        'WithDraw can\'t be Greater than E-pocket Unit Amount');
                              } else if (_isValue == 0) {
                                return showErrorHUD(
                                    title: 'Please Entry Amount');
                              }
                              formKey.currentState!.save();
                              showLoading(title: 'Loading');
                              final a = await chopper
                                  .getService<WithDrawService>()
                                  .withDraw(
                                      unit: unitController.text.trim(),
                                      amount: p.toStringAsFixed(3));
                              if (a.body!.success == false) {
                                return showErrorHUD(title: a.body!.message);
                              } else if (a.body!.success == true) {
                                logger.d(a.body!.toJson());
                                // ============================
                                //** This is ShowDialog when Success of UnitTransfer */
                                EasyLoading.dismiss();
                                return showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 350,
                                            left: 350,
                                            bottom: 200,
                                            top: 200),
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                KImage.check,
                                                height: 40,
                                              ),
                                              Text(
                                                'Success',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: ColorManager
                                                        .neptuneText),
                                              ),
                                              Text(a.body!.message),
                                              gapSize(20, 0),
                                              ButtonWidget(
                                                text: 'OK',
                                                onPress: () {
                                                  context.router.pop();

                                                  unitController.clear();
                                                },
                                                height: 47,
                                                weight: 143,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            height: 59,
                            weight: double.infinity,
                          )
                        ],
                      ),
                    ),
                  );
                } else if (checkState is TransferAvailableError) {
                  return const Text('Something went Wrong');
                }
              }
              return const Text('');
            },
          ),
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          BlocBuilder<CheckMemberCubit, CheckMemberState>(
            builder: (context, checkState) {
              if (checkState is CheckMemberInitial ||
                  checkState is CheckMemberLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (checkState is CheckMemberLoaded) {
                if (checkState.memberCheckResponse.success == false) {
                  return Text(
                    checkState.memberCheckResponse.message!,
                    style: getTextStyle(
                        15, FontWeight.bold, ColorManager.signText),
                  );
                } else if (checkState.memberCheckResponse.success == true &&
                    _isReset) {
                  //** neptune Unit multiple by UnitController */
                  var p = neptuneValue * _isValue;
                  var dollarData = dollar * _isValue;
                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Available E-pocket Units',
                              style: getTextStyle(
                                  15, FontWeight.bold, ColorManager.signText),
                            ),
                            Text(
                              "${checkState.memberCheckResponse.ePocket}U",
                              style: getTextStyle(
                                  15, FontWeight.bold, ColorManager.signText),
                            ),
                          ],
                        ),
                        gapSize(15, 0),
                        TextFormField(
                          onChanged: (v) {
                            _isValue = int.parse(v);
                            setState(() {});
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: unitController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: inputDecoaration(
                              hint: 'Units',
                              fillColor: ColorManager.conatinerColors,
                              label: 'Units'),
                        ),
                        Visibility(
                          visible: unitController.text.isNotEmpty,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${unitController.text}U = ₹ ${p.toStringAsFixed(3)} /\$ ${dollarData.toStringAsFixed(3)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapSize(20, 0),
                        ButtonWidget(
                          text: 'Send',
                          onPress: () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            } else if (unitController.text.isEmpty) {
                              return showErrorHUD(title: 'Unit can\t be empty');
                            } else if (checkState.memberCheckResponse.ePocket! <
                                _isValue) {
                              return showErrorHUD(
                                  title:
                                      'WithDraw can\'t be Greater than E-pocket Unit Amount');
                            } else if (_isValue == 0) {
                              return showErrorHUD(title: 'Please Entry Amount');
                            }
                            formKey.currentState!.save();
                            showLoading(title: 'Loading');
                            final a = await chopper
                                .getService<WithDrawService>()
                                .withDraw(
                                    unit: unitController.text.trim(),
                                    amount: p.toStringAsFixed(3));
                            if (a.body!.success == false) {
                              return showErrorHUD(title: a.body!.message);
                            } else if (a.body!.success == true) {
                              logger.d(a.body!.toJson());
                              // ============================
                              //** This is ShowDialog when Success of UnitTransfer */
                              EasyLoading.dismiss();
                              return showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return Padding(
                                      padding: const EdgeInsets.all(80),
                                      child: Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              KImage.check,
                                              height: 40,
                                            ),
                                            Text(
                                              'Success',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color:
                                                      ColorManager.neptuneText),
                                            ),
                                            Text(a.body!.message),
                                            gapSize(20, 0),
                                            ButtonWidget(
                                              text: 'OK',
                                              onPress: () {
                                                context.router.pop();
                                                unitController.clear();
                                              },
                                              height: 47,
                                              weight: 143,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          height: 59,
                          weight: double.infinity,
                        )
                      ],
                    ),
                  );
                } else if (checkState is TransferAvailableError) {
                  return const Text('Something went Wrong');
                }
              }
              return const Text('');
            },
          ),
      ],
    );
  }
}
