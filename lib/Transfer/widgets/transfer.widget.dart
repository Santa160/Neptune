import 'dart:developer';

import 'package:Neptune/Transfer/logic/Transfer_available/transfer_available_cubit.dart';
import 'package:Neptune/Transfer/logic/member_view/member_view_cubit.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/core/widget/input_decoration.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/transfer/transfer.service.dart';
import 'package:flutter/material.dart';
import 'package:Neptune/Responsive/responsive_layout.dart';
import 'package:Neptune/core/core.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/example.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({super.key});

  @override
  State<TransferWidget> createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController memberIDController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool _IdMemberCheck = false;
  bool _isRest = true;
  int? amountData;
  String? data;
  @override
  void initState() {
    context.read<TransferAvailableCubit>().getAvailableTransfer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeData = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            'E-pocket Units Transfer',
            style: getTextStyle(25, FontWeight.w400, ColorManager.neptuneText),
          ),
          if (ResponsiveLayoutPage.isTablet(context) ||
              ResponsiveLayoutPage.isDesktop(context) ||
              ResponsiveLayoutPage.isExtraLarge(context))

            //** Check For Available Unit can Transfer */

            BlocBuilder<TransferAvailableCubit, TransferAvailableState>(
              builder: (context, transferState) {
                if (transferState is TransferAvailableInitial ||
                    transferState is TransferAvailableLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (transferState is TransferAvailableLoaded) {
                  return Column(
                    children: [
                      if (transferState.transferAvailableResponse.success ==
                              false ||
                          transferState.transferAvailableResponse
                                  .ePocketTransferableAmount ==
                              0)
                        Text(
                          // transferState.transferAvailableResponse.message ?? '',
                          'Amount can\'t be Transfer due to low balance',
                          style: getTextStyle(
                              15, FontWeight.bold, ColorManager.signText),
                        )
                      else if (transferState
                                  .transferAvailableResponse.success ==
                              true &&
                          _isRest)
                        Padding(
                          padding: const EdgeInsets.only(right: 332),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Available E-pocket Units',
                                    style: getTextStyle(15, FontWeight.bold,
                                        ColorManager.signText),
                                  ),
                                  Text(
                                    "${transferState.transferAvailableResponse.ePocketTransferableAmount}NU",
                                    style: getTextStyle(15, FontWeight.bold,
                                        ColorManager.signText),
                                  ),
                                ],
                              ),

                              gapSize(15, 0),
                              TextFormField(
                                maxLength: 9,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    return;
                                  } else if (memberIDController.text.length >
                                      7) {
                                    context
                                        .read<MemberViewCubit>()
                                        .getMemberView(
                                            id: memberIDController.text.trim());
                                    setState(() {
                                      _isRest = true;
                                    });
                                  }
                                },
                                controller: memberIDController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: inputDecoaration(
                                    counterText: '',
                                    hint: 'Member ID',
                                    fillColor: ColorManager.conatinerColors,
                                    label: 'Member ID'),
                              ),
                              gapSize(12, 0),
                              // ===================================================

                              //** View Member which we want to transfer and transfer the unit  */
                              BlocBuilder<MemberViewCubit, MemberViewState>(
                                builder: (context, state) {
                                  log(state.toString());
                                  if (state is MemberViewInitial ||
                                      state is MemberViewLoading) {
                                    return Container();
                                  } else if (state is MemberViewLoaded) {
                                    if (state.transferResponse.success ==
                                        false) {
                                      return Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: Text(
                                            state.transferResponse.message ??
                                                ''),
                                      );
                                    } else if (state.transferResponse.success ==
                                        true) {
                                      _IdMemberCheck = true;
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Visibility(
                                            visible: memberIDController
                                                .text.isNotEmpty,
                                            child: Container(
                                              // height: sizeData.height * 0.15,
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: ColorManager
                                                      .conatinerColorsTransfer,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8))),
                                              child: Column(
                                                children: [
                                                  RickRowTextWidget(
                                                      dataText: 'ID Number : ',
                                                      dynamicText: state
                                                              .transferResponse
                                                              .memberId ??
                                                          ''),
                                                  gapSize(5, 0),
                                                  RickRowTextWidget(
                                                      dataText: 'Name : ',
                                                      dynamicText: state
                                                              .transferResponse
                                                              .name ??
                                                          ''),
                                                  gapSize(5, 0),
                                                  RickRowTextWidget(
                                                      dataText:
                                                          'Phone number : ',
                                                      dynamicText: state
                                                              .transferResponse
                                                              .phone ??
                                                          ''),
                                                  gapSize(5, 0),
                                                ],
                                              ),
                                            ),
                                          ),
                                          gapSize(15, 0),
                                          Visibility(
                                            visible: memberIDController
                                                .text.isNotEmpty,
                                            child: TextFormField(
                                              onChanged: (v) {
                                                int value = int.parse(v);
                                                setState(() {
                                                  amountData = value;
                                                });
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              controller: amountController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: inputDecoaration(
                                                  hint: 'Neptune Unit',
                                                  fillColor: ColorManager
                                                      .conatinerColors,
                                                  label: 'Neptune Unit'),
                                            ),
                                          ),
                                          gapSize(20, 0),
                                          Visibility(
                                            visible: memberIDController
                                                .text.isNotEmpty,
                                            child: ButtonWidget(
                                              text: 'Send',
                                              onPress: () async {
                                                if (!formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                } else if (memberIDController
                                                    .text.isEmpty) {
                                                  return showErrorHUD(
                                                      title:
                                                          'Member ID can\'t be Empty');
                                                } else if (_IdMemberCheck ==
                                                    false) {
                                                  return showErrorHUD(
                                                      title:
                                                          'ID Member not Found');
                                                } else if (memberIDController
                                                        .text.length <
                                                    9) {
                                                  return showErrorHUD(
                                                      title:
                                                          'Member ID can\'t be less than 9 character');
                                                } else if (amountController
                                                    .text.isEmpty) {
                                                  return showErrorHUD(
                                                      title:
                                                          'Transfer Amount can\'t be empty');
                                                } else if (transferState
                                                        .transferAvailableResponse
                                                        .ePocketTransferableAmount! <
                                                    amountData!) {
                                                  return showErrorHUD(
                                                      title:
                                                          'Transfer Amount can\'t be grater than e-pocket amount');
                                                } else if (amountData! == 0) {
                                                  return showErrorHUD(
                                                      title:
                                                          'Please Entry Unit');
                                                } else if (transferState
                                                        .transferAvailableResponse
                                                        .ePocketTransferableAmount ==
                                                    0) {
                                                  return showErrorHUD(
                                                      title:
                                                          ' Insufficient   Neptune Unit Amount');
                                                }
                                                formKey.currentState!.save();
                                                showLoading(
                                                    title: 'Loading...');
                                                final a = await chopper
                                                    .getService<
                                                        TransferService>()
                                                    .getTransferOtpSend();

                                                if (a.body!.success == true) {
                                                  final pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  pref.setString(
                                                      "amountUnit",
                                                      amountController.text
                                                          .trim());
                                                  pref.setString(
                                                      "memberId",
                                                      memberIDController.text
                                                          .trim());
                                                  pref.setString('message',
                                                      a.body!.message);
                                                  context
                                                      .read<PageIndexCubit>()
                                                      .pageStatus(1);
                                                  setState(() {
                                                    _isRest = false;
                                                  });
                                                  EasyLoading.dismiss();
                                                } else if (a.body!.success ==
                                                    false) {
                                                  showErrorHUD(
                                                      title: a.body!.message);
                                                }
                                              },
                                              height: 59,
                                              weight: double.infinity,
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  } else if (state is MemberViewError) {
                                    // _IdMemberCheck = false;
                                    return Text(state.message);
                                  }
                                  return const Text('');
                                },
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                } else if (transferState is TransferAvailableError) {
                  return const Text('Something Went Wrong');
                }
                return const Text('');
              },
            ),
          if (ResponsiveLayoutPage.isMobile(context) ||
              ResponsiveLayoutPage.isMobileLarge(context))
            //** Check For Avaliable Unit can Transfer */

            BlocBuilder<TransferAvailableCubit, TransferAvailableState>(
              builder: (context, transferState) {
                if (transferState is TransferAvailableInitial ||
                    transferState is TransferAvailableLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (transferState is TransferAvailableLoaded) {
                  return Column(
                    children: [
                      if (transferState.transferAvailableResponse.success ==
                              false ||
                          transferState.transferAvailableResponse
                                  .ePocketTransferableAmount ==
                              0)
                        Text(
                          // transferState.transferAvailableResponse.message ?? '',
                          'Amount can\'t be Transfer due to low balance',
                          style: getTextStyle(
                              15, FontWeight.bold, ColorManager.signText),
                        )
                      else if (transferState
                              .transferAvailableResponse.success ==
                          true)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Available E-pocket Units',
                                  style: getTextStyle(15, FontWeight.bold,
                                      ColorManager.signText),
                                ),
                                Text(
                                  "${transferState.transferAvailableResponse.ePocketTransferableAmount}NU",
                                  style: getTextStyle(15, FontWeight.bold,
                                      ColorManager.signText),
                                ),
                              ],
                            ),

                            gapSize(15, 0),
                            TextFormField(
                                maxLength: 9,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    return;
                                  } else if (memberIDController.text.length >
                                      7) {
                                    context
                                        .read<MemberViewCubit>()
                                        .getMemberView(
                                            id: memberIDController.text.trim());
                                  }
                                },
                                controller: memberIDController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: inputDecoaration(
                                    counterText: '',
                                    hint: 'Member ID',
                                    fillColor: ColorManager.conatinerColors,
                                    label: 'Member ID')),
                            gapSize(12, 0),
                            // ===================================================
                            //** View Member which we want to transfer and transfer the unit  */
                            BlocBuilder<MemberViewCubit, MemberViewState>(
                              builder: (context, state) {
                                log(state.toString());
                                if (state is MemberViewInitial ||
                                    state is MemberViewLoading) {
                                  return Container();
                                } else if (state is MemberViewLoaded) {
                                  if (state.transferResponse.success == false) {
                                    return Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Text(
                                          state.transferResponse.message ?? ''),
                                    );
                                  } else if (state.transferResponse.success ==
                                      true) {
                                    _IdMemberCheck = true;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Visibility(
                                          visible: memberIDController
                                              .text.isNotEmpty,
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: ColorManager
                                                    .conatinerColorsTransfer,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8))),
                                            child: Column(
                                              children: [
                                                RickRowTextWidget(
                                                    dataText: 'ID Number : ',
                                                    dynamicText: state
                                                            .transferResponse
                                                            .memberId ??
                                                        ''),
                                                gapSize(5, 0),
                                                RickRowTextWidget(
                                                    dataText: 'Name : ',
                                                    dynamicText: state
                                                            .transferResponse
                                                            .name ??
                                                        ''),
                                                gapSize(5, 0),
                                                RickRowTextWidget(
                                                    dataText: 'Phone number : ',
                                                    dynamicText: state
                                                            .transferResponse
                                                            .phone ??
                                                        ''),
                                                gapSize(5, 0),
                                              ],
                                            ),
                                          ),
                                        ),
                                        gapSize(15, 0),
                                        Visibility(
                                          visible: memberIDController
                                              .text.isNotEmpty,
                                          child: TextFormField(
                                            onChanged: (v) {
                                              int value = int.parse(v);
                                              setState(() {
                                                amountData = value;
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            controller: amountController,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: inputDecoaration(
                                                hint: 'Neptune Unit',
                                                fillColor: ColorManager
                                                    .conatinerColors,
                                                label: 'Neptune Unit'),
                                          ),
                                        ),
                                        gapSize(20, 0),
                                        Visibility(
                                          visible: memberIDController
                                              .text.isNotEmpty,
                                          child: ButtonWidget(
                                            text: 'Send',
                                            onPress: () async {
                                              if (!formKey.currentState!
                                                  .validate()) {
                                                return;
                                              } else if (memberIDController
                                                  .text.isEmpty) {
                                                return showErrorHUD(
                                                    title:
                                                        'Member ID can\'t be empty');
                                              } else if (_IdMemberCheck ==
                                                  false) {
                                                return showErrorHUD(
                                                    title:
                                                        'ID Member not Found');
                                              } else if (memberIDController
                                                      .text.length <
                                                  9) {
                                                return showErrorHUD(
                                                    title:
                                                        'Member ID can\'t be less than 9 character');
                                              } else if (amountController
                                                  .text.isEmpty) {
                                                return showErrorHUD(
                                                    title:
                                                        'Transfer Amount can\'t be empty');
                                              } else if (transferState
                                                      .transferAvailableResponse
                                                      .ePocketTransferableAmount! <
                                                  amountData!) {
                                                return showErrorHUD(
                                                    title:
                                                        'Transfer Amount can\'t be grater than e-pocket amount');
                                              } else if (amountData! == 0) {
                                                return showErrorHUD(
                                                    title: 'Please Entry Unit');
                                              } else if (transferState
                                                      .transferAvailableResponse
                                                      .ePocketTransferableAmount ==
                                                  0) {
                                                return showErrorHUD(
                                                    title:
                                                        ' Insufficient   Neptune Unit Amount');
                                              }
                                              formKey.currentState!.save();
                                              showLoading(title: 'Loading...');
                                              final a = await chopper
                                                  .getService<TransferService>()
                                                  .getTransferOtpSend();

                                              if (a.body!.success == true) {
                                                final pref =
                                                    await SharedPreferences
                                                        .getInstance();
                                                pref.setString(
                                                    "amountUnit",
                                                    amountController.text
                                                        .trim());
                                                pref.setString(
                                                    "memberId",
                                                    memberIDController.text
                                                        .trim());
                                                pref.setString(
                                                    'message', a.body!.message);
                                                context
                                                    .read<PageIndexCubit>()
                                                    .pageStatus(1);
                                                EasyLoading.dismiss();
                                              } else if (a.body!.success ==
                                                  false) {
                                                showErrorHUD(
                                                    title: a.body!.message);
                                              }
                                            },
                                            height: 59,
                                            weight: double.infinity,
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                } else if (state is MemberViewError) {
                                  _IdMemberCheck = false;
                                  return Text(state.message);
                                }
                                return const Text('');
                              },
                            ),
                          ],
                        ),
                    ],
                  );
                } else if (transferState is TransferAvailableError) {
                  return const Text('Error');
                }
                return const Text('');
              },
            ),
        ],
      ),
    );
  }
}
