import 'package:Neptune/AddMember/logic/logic.dart';
import 'package:Neptune/core/widget/button.widget.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/addMember/add_member.service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Home/example.dart';
import '../../Responsive/responsive.dart';
import '../../core/constant/date_formater.dart';
import '../../core/core.dart';
import '../../core/widget/input_decoration.widget.dart';

class AddMemberWidget extends StatefulWidget {
  const AddMemberWidget({
    super.key,
  });

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  String? _selectRadio;
  String? leftNode;
  String? rightNode;
  int? amountData;
  int? phoneNumberCheckValue;
  TextEditingController memberIDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isReset = true;

  @override
  void initState() {
    context.read<CheckMemberCubit>().checkMember();
    super.initState();
  }

//** After NewMember Add this will show newMemberID for Success */
  void showMember({required String memberID, required String message}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.only(
                right: 350, left: 350, bottom: 200, top: 200),
            child: Card(
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
                        fontSize: 25, color: ColorManager.neptuneText),
                  ),
                  Text(memberID),
                  Text(message),
                  gapSize(20, 0),
                  ButtonWidget(
                    text: 'OK',
                    onPress: () {
                      context.read<DashBaordCubit>().getDash();
                      context.read<CheckMemberCubit>().checkMember();
                      context.router.pop();
                      setState(() {
                        _isReset = false;
                      });

                      memberIDController.clear();
                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
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

  @override
  void dispose() {
    memberIDController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-pocket Add Member',
          style: getTextStyle(25, FontWeight.w400, ColorManager.neptuneText),
        ),

        // =============================================================
//** This will done for checking newMember Add is offer or not */
        BlocBuilder<AddMemberOfferCubit, AddMemberOfferState>(
            builder: (context, state) {
          if (state is AddMemberOfferInitial ||
              state is AddMemberOfferLoading) {
            return Container();
          } else if (state is AddMemberOfferLoaded) {
            final a = state.addMemberOfferModel;
            if (state.addMemberOfferModel.success == true) {
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          content: SizedBox(
                            width: 300,
                            height: 200,
                            child: Column(
                              children: [
                                Text(
                                  a.dataList!.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Table(
                                  border: const TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                        style: BorderStyle.solid),
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        tableCellMethod('Form'),
                                        tableCellMethod('To'),
                                      ],
                                    ),
                                    TableRow(
                                      children: [
                                        Text(DateTimeNotTime.dateTimeFomator(
                                            a.dataList!.dateFrom)),
                                        Text(
                                            ' ${DateTimeNotTime.dateTimeFomator(a.dataList!.dateTo)}'),
                                      ],
                                    ),
                                  ],
                                ),
                                Table(
                                  border: const TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                        style: BorderStyle.solid),
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        tableCellMethod('SL.NO'),
                                        tableCellMethod('UnitFrom'),
                                        tableCellMethod('UnitTo'),
                                        tableCellMethod('OfferUnit'),
                                      ],
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: a.dataList!.units.length,
                                  itemBuilder: (context, index) {
                                    return Table(
                                      border: const TableBorder(
                                        horizontalInside: BorderSide(
                                            width: 1,
                                            color: Colors.grey,
                                            style: BorderStyle.solid),
                                      ),
                                      children: [
                                        TableRow(
                                          children: [
                                            Text((index + 1).toString()),
                                            Text(a
                                                .dataList!.units[index].unitFrom
                                                .toString()),
                                            Text(a.dataList!.units[index].unitTo
                                                .toString()),
                                            Text(a.dataList!.units[index]
                                                .offerUnit
                                                .toString())
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  'Promotion Offer Available',
                  style: getTextStyle(
                      18, FontWeight.w200, ColorManager.buttonColor),
                ),
              );
            } else if (state.addMemberOfferModel.success == false) {
              return Text(state.addMemberOfferModel.message!);
            }
          } else if (state is AddMemberOfferError) {
            return const Center(child: Text(''));
          }
          return Container();
        }),
        if (ResponsiveLayoutPage.isTablet(context) ||
            ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context))
          //** First Checking Weather member should be NewAdded form e-pockect Unit or not */
          //** Check For  New Member add */

          BlocBuilder<CheckMemberCubit, CheckMemberState>(
            builder: (context, checkState) {
              if (checkState is CheckMemberInitial ||
                  checkState is CheckMemberLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (checkState is CheckMemberLoaded) {
                if (checkState.memberCheckResponse.success == false) {
                  return Text(checkState.memberCheckResponse.message!,
                      style: getTextStyle(
                          15, FontWeight.bold, ColorManager.signText));
                } else if (checkState.memberCheckResponse.success == true) {
                  final mim = checkState.memberCheckResponse.minimumOpeningUnit;
                  return Padding(
                    padding: const EdgeInsets.only(right: 332),
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
                          maxLength: 9,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              return;
                            } else if (memberIDController.text.length > 7) {
                              context.read<AddMemberSponsorCubit>().addMember(
                                  id: memberIDController.text.trim());
                              setState(() {
                                _isReset = true;
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
                        //** Afther Checking memberAdd. THis will do when newMember Should be Added */
                        //**  Showing new Member Add  */

                        BlocBuilder<AddMemberSponsorCubit,
                            AddMemberSponsorState>(
                          builder: (context, state) {
                            if (state is AddMemberSponsorInitial ||
                                state is AddMemberSponsorLoading) {
                              return Container();
                            } else if (state is AddMemberSponsorLoaded) {
                              if (state.addMemberResponse.success == false) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(state.addMemberResponse.message
                                        .toString()),
                                  ],
                                );
                              } else if (state.addMemberResponse.success ==
                                      true &&
                                  _isReset) {
                                return Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Visibility(
                                              visible: memberIDController
                                                  .text.isNotEmpty,
                                              child: Text(state
                                                  .addMemberResponse.name)),
                                        ],
                                      ),
                                      gapSize(5, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: Text(
                                          'Choose which You want to add Sponsor',
                                          style: getTextStyle(
                                              20,
                                              FontWeight.normal,
                                              ColorManager.neptuneText),
                                        ),
                                      ),
                                      gapSize(5, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: Row(
                                          children: [
                                            state.addMemberResponse.left ==
                                                    false
                                                ? const Text(
                                                    'Already Add To Left')
                                                : Visibility(
                                                    visible: memberIDController
                                                        .text.isNotEmpty,
                                                    child: Row(
                                                      children: [
                                                        Radio<String>(
                                                          value: 'Left',
                                                          groupValue:
                                                              _selectRadio,
                                                          onChanged: state
                                                                      .addMemberResponse
                                                                      .left ==
                                                                  false
                                                              ? null
                                                              : (value) =>
                                                                  setState(() =>
                                                                      _selectRadio =
                                                                          value),
                                                        ),
                                                        const Text('Add Left')
                                                      ],
                                                    ),
                                                  ),
                                            gapSize(0, 10),
                                            state.addMemberResponse.right ==
                                                    false
                                                ? const Text(
                                                    'Already Add To Right')
                                                : Visibility(
                                                    visible: memberIDController
                                                        .text.isNotEmpty,
                                                    child: Row(
                                                      children: [
                                                        Radio<String>(
                                                          value: 'Right',
                                                          groupValue:
                                                              _selectRadio,
                                                          onChanged: state
                                                                      .addMemberResponse
                                                                      .right ==
                                                                  false
                                                              ? null
                                                              : (value) =>
                                                                  setState(() =>
                                                                      _selectRadio =
                                                                          value),
                                                        ),
                                                        const Text('Add Right')
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      gapSize(10, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: Text(
                                          'Payment Details',
                                          style: getTextStyle(
                                            20,
                                            FontWeight.w400,
                                            ColorManager.signText,
                                          ),
                                        ),
                                      ),
                                      gapSize(10, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: TextFormField(
                                          controller: nameController,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: inputDecoaration(
                                              iconButton: const IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons.person)),
                                              hint: 'Name',
                                              fillColor:
                                                  ColorManager.conatinerColors,
                                              label: 'Name'),
                                        ),
                                      ),
                                      gapSize(11, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: TextFormField(
                                          controller: emailController,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: inputDecoaration(
                                              iconButton: const IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons.email)),
                                              hint: 'Email',
                                              fillColor:
                                                  ColorManager.conatinerColors,
                                              label: 'Email'),
                                        ),
                                      ),
                                      gapSize(19, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: TextFormField(
                                          maxLength: 10,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          controller: phoneController,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: inputDecoaration(
                                              counterText: '',
                                              iconButton: const IconButton(
                                                  onPressed: null,
                                                  icon: Icon(Icons.phone)),
                                              hint: 'Mobile Number',
                                              fillColor:
                                                  ColorManager.conatinerColors,
                                              label: 'Mobile Number'),
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: Text(
                                          'Units',
                                          style: getTextStyle(
                                            20,
                                            FontWeight.w400,
                                            ColorManager.signText,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: memberIDController
                                              .text.isNotEmpty,
                                          child: Text(
                                              "Minimum Opening Unit $mim NU")),
                                      gapSize(10, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: TextFormField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          onChanged: (v) {
                                            int value = int.parse(v);
                                            setState(() {
                                              amountData = value;
                                            });
                                          },
                                          controller: unitController,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: inputDecoaration(
                                              hint: 'Neptune Unit',
                                              fillColor:
                                                  ColorManager.conatinerColors,
                                              label: 'Neptune Unit'),
                                        ),
                                      ),
                                      gapSize(10, 0),
                                      Visibility(
                                        visible:
                                            memberIDController.text.isNotEmpty,
                                        child: ButtonWidget(
                                          text: 'Add Member',
                                          onPress: () async {
                                            if (!formKey.currentState!
                                                .validate()) {
                                              return;
                                            } else if (state.addMemberResponse
                                                    .success ==
                                                false) {
                                              return showErrorHUD(
                                                  title: state
                                                      .addMemberResponse.message
                                                      .toString());
                                            } else if (memberIDController
                                                .text.isEmpty) {
                                              return showErrorHUD(
                                                  title:
                                                      'Sponsored ID Can\'t be Empty');
                                            } else if (nameController
                                                .text.isEmpty) {
                                              return showErrorHUD(
                                                  title:
                                                      'Name can\'t be empty');
                                            } else if (emailController
                                                .text.isEmpty) {
                                              return showErrorHUD(
                                                  title:
                                                      'Email can\'t be Empty');
                                            } else if (phoneController
                                                .text.isEmpty) {
                                              return showErrorHUD(
                                                  title:
                                                      'Phone Number can\t be Empty');
                                            } else if (unitController
                                                .text.isEmpty) {
                                              return showErrorHUD(
                                                  title:
                                                      'Unit account can\'t be Empty');
                                            } else if (_selectRadio == null) {
                                              return showErrorHUD(
                                                  title:
                                                      'Choose which You want to add Sponsor');
                                            } else if (checkState
                                                    .memberCheckResponse
                                                    .ePocket! <
                                                amountData!) {
                                              return showErrorHUD(
                                                  title:
                                                      'Unit can\'t be Greater than e-pocket amount');
                                            } else if (checkState
                                                    .memberCheckResponse
                                                    .minimumOpeningUnit! >
                                                amountData!) {
                                              return showErrorHUD(
                                                  title:
                                                      'Minimum Opening Unit 200NU ');
                                            } else if (amountData! == 0) {
                                              return showErrorHUD(
                                                  title: 'Please Entry Amount');
                                            }
                                            formKey.currentState!.save();
                                            showLoading(title: 'Loading');
                                            final a = await chopper
                                                .getService<AddMemberService>()
                                                .createMember(
                                                    sponsorId:
                                                        memberIDController.text
                                                            .trim(),
                                                    position: _selectRadio!,
                                                    unit: amountData.toString(),
                                                    name: nameController.text
                                                        .trim(),
                                                    email: emailController.text
                                                        .trim(),
                                                    phone: phoneController.text
                                                        .trim());
                                            if (a.body!.success == false) {
                                              return showErrorHUD(
                                                  title: a.body!.message!);
                                            } else if (a.body!.success ==
                                                true) {
                                              EasyLoading.dismiss();

                                              // =============================================
                                              //** This will show after success */
                                              showMember(
                                                  memberID:
                                                      a.body!.memberId ?? '',
                                                  message:
                                                      a.body!.message ?? '');
                                            }
                                          },
                                          height: 59,
                                          weight: double.infinity,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                            } else if (state is AddMemberSponsorError) {
                              return Visibility(
                                  visible: memberIDController.text.isNotEmpty,
                                  child: const Text('Invalid sponsor number.'));
                            }
                            return const Text('');
                          },
                        )
                      ],
                    ),
                  );
                }
              } else if (checkState is CheckMemberError) {
                return Visibility(
                    visible: memberIDController.text.isNotEmpty,
                    child: const Text('Invalid sponsor number.'));
              }
              return const Text('');
            },
          ),
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          //** First Checking Weather member should be NewAdded form e-pocket Unit or not */
          //** Check For  New Member add */

          BlocBuilder<CheckMemberCubit, CheckMemberState>(
            builder: (context, checkState) {
              if (checkState is CheckMemberInitial ||
                  checkState is CheckMemberLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (checkState is CheckMemberLoaded) {
                if (checkState.memberCheckResponse.success == false) {
                  return Text(checkState.memberCheckResponse.message!,
                      style: getTextStyle(
                          15, FontWeight.bold, ColorManager.signText));
                } else if (checkState.memberCheckResponse.success == true) {
                  final minimumOpeningUnit =
                      checkState.memberCheckResponse.minimumOpeningUnit;
                  return Column(
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
                        maxLength: 9,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            return;
                          } else if (memberIDController.text.length > 7) {
                            context
                                .read<AddMemberSponsorCubit>()
                                .addMember(id: memberIDController.text.trim());
                            setState(() {
                              _isReset = true;
                            });
                          }
                        },
                        controller: memberIDController,
                        // textAlignVertical: TextAlignVertical.,
                        decoration: inputDecoaration(
                            counterText: '',
                            hint: 'Sponsored ID',
                            fillColor: ColorManager.conatinerColors,
                            label: 'Sponsored ID'),
                      ),
                      //** After Checking memberAdd. This will do when newMember Should be Added */
                      //**  Showing new Member Add  */

                      BlocBuilder<AddMemberSponsorCubit, AddMemberSponsorState>(
                        builder: (context, state) {
                          if (state is AddMemberSponsorInitial ||
                              state is AddMemberSponsorLoading) {
                            return Container();
                          } else if (state is AddMemberSponsorLoaded) {
                            if (state.addMemberResponse.success == false) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: memberIDController.text.isNotEmpty,
                                    child: Text(state.addMemberResponse.message
                                        .toString()),
                                  ),
                                ],
                              );
                            } else if (state.addMemberResponse.success ==
                                    true &&
                                _isReset) {
                              return Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Visibility(
                                            visible: memberIDController
                                                .text.isNotEmpty,
                                            child: Text(
                                                state.addMemberResponse.name)),
                                      ],
                                    ),
                                    gapSize(5, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Text(
                                        'Choose which You want to add Sponsor',
                                        style: getTextStyle(
                                            20,
                                            FontWeight.normal,
                                            ColorManager.neptuneText),
                                      ),
                                    ),
                                    gapSize(5, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Row(
                                        children: [
                                          state.addMemberResponse.left == false
                                              ? const Text(
                                                  'Already Add To Left')
                                              : Visibility(
                                                  visible: memberIDController
                                                      .text.isNotEmpty,
                                                  child: Row(
                                                    children: [
                                                      Radio<String>(
                                                        value: 'Left',
                                                        groupValue:
                                                            _selectRadio,
                                                        onChanged: state
                                                                    .addMemberResponse
                                                                    .left ==
                                                                false
                                                            ? null
                                                            : (value) =>
                                                                setState(() =>
                                                                    _selectRadio =
                                                                        value),
                                                      ),
                                                      const Text('Add Left')
                                                    ],
                                                  ),
                                                ),
                                          gapSize(0, 10),
                                          state.addMemberResponse.right == false
                                              ? const Text(
                                                  'Already Add To Right')
                                              : Visibility(
                                                  visible: memberIDController
                                                      .text.isNotEmpty,
                                                  child: Row(
                                                    children: [
                                                      Radio<String>(
                                                        value: 'Right',
                                                        groupValue:
                                                            _selectRadio,
                                                        onChanged: state
                                                                    .addMemberResponse
                                                                    .right ==
                                                                false
                                                            ? null
                                                            : (value) =>
                                                                setState(() =>
                                                                    _selectRadio =
                                                                        value),
                                                      ),
                                                      const Text('Add Right')
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    gapSize(10, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Text(
                                        'Payment Details',
                                        style: getTextStyle(
                                          20,
                                          FontWeight.w400,
                                          ColorManager.signText,
                                        ),
                                      ),
                                    ),
                                    gapSize(10, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: TextFormField(
                                        controller: nameController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: inputDecoaration(
                                            iconButton: const IconButton(
                                                onPressed: null,
                                                icon: Icon(Icons.person)),
                                            hint: 'Name',
                                            fillColor:
                                                ColorManager.conatinerColors,
                                            label: 'Name'),
                                      ),
                                    ),
                                    gapSize(11, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: TextFormField(
                                        controller: emailController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: inputDecoaration(
                                            iconButton: const IconButton(
                                                onPressed: null,
                                                icon: Icon(Icons.email)),
                                            hint: 'Email',
                                            fillColor:
                                                ColorManager.conatinerColors,
                                            label: 'Email'),
                                      ),
                                    ),
                                    gapSize(19, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: TextFormField(
                                        maxLength: 10,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        controller: phoneController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: inputDecoaration(
                                            counterText: '',
                                            iconButton: const IconButton(
                                                onPressed: null,
                                                icon: Icon(Icons.phone)),
                                            hint: 'Mobile Number',
                                            fillColor:
                                                ColorManager.conatinerColors,
                                            label: 'Mobile Number'),
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Text(
                                        'Units',
                                        style: getTextStyle(
                                          20,
                                          FontWeight.w400,
                                          ColorManager.signText,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: Text(
                                          "Minimum Opening Unit $minimumOpeningUnit NU"),
                                    ),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (v) {
                                          int value = int.parse(v);
                                          setState(() {
                                            amountData = value;
                                          });
                                        },
                                        controller: unitController,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: inputDecoaration(
                                            hint: 'Neptune Unit',
                                            fillColor:
                                                ColorManager.conatinerColors,
                                            label: 'Neptune Unit'),
                                      ),
                                    ),
                                    gapSize(10, 0),
                                    Visibility(
                                      visible:
                                          memberIDController.text.isNotEmpty,
                                      child: ButtonWidget(
                                        text: 'Add Member',
                                        onPress: () async {
                                          if (!formKey.currentState!
                                              .validate()) {
                                            return;
                                          } else if (state
                                                  .addMemberResponse.success ==
                                              false) {
                                            return showErrorHUD(
                                                title: state
                                                    .addMemberResponse.message
                                                    .toString());
                                          } else if (memberIDController
                                              .text.isEmpty) {
                                            return showErrorHUD(
                                                title:
                                                    'Sponsored ID Can\'t be Empty');
                                          } else if (nameController
                                              .text.isEmpty) {
                                            return showErrorHUD(
                                                title: 'Name can\'t be empty');
                                          } else if (emailController
                                              .text.isEmpty) {
                                            return showErrorHUD(
                                                title: 'Email can\'t be Empty');
                                          } else if (phoneController
                                              .text.isEmpty) {
                                            return showErrorHUD(
                                                title:
                                                    'Phone Number can\t be Empty');
                                          } else if (unitController
                                              .text.isEmpty) {
                                            return showErrorHUD(
                                                title:
                                                    'Unit amount can\'t be Empty');
                                          } else if (_selectRadio == null) {
                                            return showErrorHUD(
                                                title:
                                                    'Choose which You want to add Sponsor');
                                          } else if (checkState
                                                  .memberCheckResponse
                                                  .ePocket! <
                                              amountData!) {
                                            return showErrorHUD(
                                                title:
                                                    'Unit can\'t be Greater than e-pocket amount');
                                          } else if (checkState
                                                  .memberCheckResponse
                                                  .minimumOpeningUnit! >
                                              amountData!) {
                                            return showErrorHUD(
                                                title:
                                                    'Minimum Opening Unit 200NU');
                                          } else if (amountData! == 0) {
                                            return showErrorHUD(
                                                title:
                                                    'Please Entry Unit Amount');
                                          }
                                          formKey.currentState!.save();
                                          showLoading(title: 'Loading');
                                          final a = await chopper
                                              .getService<AddMemberService>()
                                              .createMember(
                                                  sponsorId: memberIDController
                                                      .text
                                                      .trim(),
                                                  position: _selectRadio!,
                                                  unit: amountData.toString(),
                                                  name: nameController.text
                                                      .trim(),
                                                  email: emailController.text
                                                      .trim(),
                                                  phone: phoneController.text
                                                      .trim());
                                          if (a.body!.success == false) {
                                            return showErrorHUD(
                                                title: a.body!.message!);
                                          } else if (a.body!.success == true) {
                                            EasyLoading.dismiss();
                                            //** This will show Success AddMember */
                                            showMember(
                                                memberID:
                                                    a.body!.memberId ?? '',
                                                message: a.body!.message ?? '');
                                          }
                                        },
                                        height: 59,
                                        weight: double.infinity,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          } else if (state is AddMemberSponsorError) {
                            return Visibility(
                                visible: memberIDController.text.isNotEmpty,
                                child: const Text('Invalid sponsor number.'));
                          }
                          return const Text('');
                        },
                      )
                    ],
                  );
                }
              } else if (checkState is CheckMemberError) {
                return Visibility(
                    visible: memberIDController.text.isNotEmpty,
                    child: const Text('Invalid sponsor number.'));
              }
              return const Text('');
            },
          ),
      ],
    );
  }
}

TableCell tableCellMethod(String text) {
  return TableCell(
    child: Container(
      height: 25,
      color: ColorManager.buttonColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
