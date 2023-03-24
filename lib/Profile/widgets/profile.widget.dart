import 'package:Neptune/core/helper/logger.dart';
import 'package:Neptune/core/widget/button.widget.dart';
import 'package:Neptune/core/widget/eassy_loading.widget.dart';
import 'package:Neptune/service/chopper_client.service.dart';
import 'package:Neptune/service/chopper_service/profile/profile_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:Neptune/Responsive/responsive_layout.dart';
import 'package:Neptune/core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widget/input_decoration.widget.dart';
import '../example.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.idType,
    required this.idNumber,
    required this.address,
    required this.landMark,
    required this.countryId,
    required this.country,
    required this.state,
    required this.stateId,
    required this.district,
    required this.pincode,
    required this.idprooffiles,
    required this.addressprooffiles,
  });
  final String idType;
  final String idNumber;
  final String address;
  final String landMark;
  final String countryId;
  final String country;
  final String state;
  final String stateId;
  final String district;
  final String pincode;
  final String idprooffiles;
  final String addressprooffiles;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String? paymentId;
  List<PlatformFile>? _paths1;
  List<PlatformFile>? _paths2;
  String? imageFileName1;
  Uint8List? selectedImageByte1;
  Uint8List? selectedImageByte2;
  String? imageFileName2;
  String? countryData;
  String? countryId;

  String? stateData;
  String baseUrl = 'https://register.neptunetourist.com';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    context.read<StateCubit>().getState('101');

    addressController.text = widget.address;
    landMarkController.text = widget.landMark;
    districtController.text = widget.district;
    pinCodeController.text = widget.pincode;
    idController.text = widget.idNumber;

    super.initState();
  }

  var dio = Dio();

  @override
  void dispose() {
    // idController.dispose();
    // addressController.dispose();
    // landMarkController.dispose();
    // pinCodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  Large Screen
        if (ResponsiveLayoutPage.isTablet(context) ||
            ResponsiveLayoutPage.isDesktop(context) ||
            ResponsiveLayoutPage.isExtraLarge(context))
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personal Details
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        Image.asset(
                                          KImage.person,
                                          height: 28,
                                        ),
                                        gapSize(0, 10),
                                        const Text("Personal Details"),
                                      ],
                                    ),
                                    content: Form(
                                      key: _formKey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            BlocBuilder<IdProofTypeCubit,
                                                IdProofTypeState>(
                                              builder: (context, state) {
                                                if (state
                                                        is IdProofTypeInitial ||
                                                    state
                                                        is IdProofTypeLoading) {
                                                  return Container();
                                                } else if (state
                                                    is IdProofTypeLoaded) {
                                                  final id =
                                                      state.idProofTypeModel;

                                                  // ===================================
                                                  //////////////////////////////////////
                                                  //** This is For Choose  PaymentType Selected  */ */
                                                  return buildIdPaymentDropDown(
                                                      sizeData.width * 0.25,
                                                      id,
                                                      setState);
                                                } else if (state
                                                    is IdProofTypeError) {
                                                  return const Center(
                                                      child: Text(
                                                          'Something Went Wrong'));
                                                }
                                                return const Center(
                                                  child: Text(''),
                                                );
                                              },
                                            ),
                                            gapSize(15, 0),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: idController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: inputDecoaration(
                                                  hint: 'Enter ID Number',
                                                  fillColor: ColorManager
                                                      .conatinerColors,
                                                  label: 'Enter ID Number'),
                                            ),
                                            gapSize(15, 0),
                                            // ===================================
                                            //////////////////////////////////////
                                            //**This is for using imagePicker package To get Image for System  */ */
                                            InkWell(
                                              onTap: () async {
                                                try {
                                                  _paths1 = (await FilePicker
                                                          .platform
                                                          .pickFiles(
                                                    type: FileType.custom,
                                                    allowMultiple: false,
                                                    onFileLoading:
                                                        (FilePickerStatus
                                                                status) =>
                                                            print(status),
                                                    allowedExtensions: [
                                                      'png',
                                                      'jpg',
                                                      'jpeg',
                                                      'heic'
                                                    ],
                                                  ))
                                                      ?.files;
                                                } on PlatformException catch (e) {
                                                  print(
                                                      'Unsupported operation$e');
                                                } catch (e) {
                                                  print(e.toString());
                                                }
                                                setState(() {
                                                  if (_paths1 != null) {
                                                    selectedImageByte1 =
                                                        _paths1!.first.bytes!;
                                                    //passing file bytes and file name for API call
                                                    imageFileName1 =
                                                        _paths1!.first.name;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                width: sizeData.width * 0.25,
                                                height: 189,
                                                decoration: BoxDecoration(
                                                  color: ColorManager
                                                      .conatinerColors,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                child: selectedImageByte1 ==
                                                        null
                                                    ? DottedBorder(
                                                        borderType:
                                                            BorderType.RRect,
                                                        radius: const Radius
                                                            .circular(20),
                                                        dashPattern: const [
                                                          10,
                                                          10
                                                        ],
                                                        color: Colors.black,
                                                        strokeWidth: 1,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(Icons
                                                                    .upload)
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Text(
                                                                    'Upload your ID Card here')
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : Image.memory(
                                                        selectedImageByte1!,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                            gapSize(15, 0),
                                            ButtonWidget(
                                              text: 'Save',
                                              onPress: () async {
                                                if (!_formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                } else if (imageFileName1 ==
                                                        null ||
                                                    paymentId == null ||
                                                    idController.text.isEmpty) {
                                                  return showErrorHUD(
                                                      title:
                                                          'All Field required');
                                                }
                                                _formKey.currentState!.save();
                                                showLoading(
                                                    title: 'Loading...');
                                                final pref =
                                                    await SharedPreferences
                                                        .getInstance();

                                                final a = await chopper
                                                    .getService<
                                                        ProfileService>()
                                                    .getKycIdDoc(
                                                        payment: paymentId!,
                                                        idNumber: idController
                                                            .text
                                                            .trim());
                                                if (a.body!.success == false) {
                                                  return showErrorHUD(
                                                      title: a.body!.message);
                                                }
                                                // ===================================
                                                //////////////////////////////////////
                                                //**This is for using Dio package To Upload MultiPart Image Upload to server  */ */
                                                FormData formData =
                                                    FormData.fromMap(
                                                  {
                                                    "id_proof_file":
                                                        MultipartFile.fromBytes(
                                                      _paths1!.first.bytes!,
                                                      filename:
                                                          _paths1!.first.name,
                                                      contentType: MediaType(
                                                          "image", "png"),
                                                    )
                                                  },
                                                );
                                                var response = await dio.post(
                                                    URLPath.host,
                                                    data: formData,
                                                    options: Options(headers: {
                                                      "authorization":
                                                          "Bearer ${pref.getString('token')}"
                                                    }));
                                                logger
                                                    .d(response.statusMessage);
                                                showSuccess(
                                                    title: a.body!.message);
                                                context
                                                    .read<KycCubit>()
                                                    .refreshScreen();
                                                context.router.pop();
                                              },
                                              height: 59,
                                              weight: double.infinity,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                            color: bodyTextColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    RickRowTextWidget(
                        dataText: 'ID Type :', dynamicText: widget.idType),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: 'ID Number : ', dynamicText: widget.idNumber),
                    gapSize(5, 0),
                    const Text(
                      'ID photo proof : ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ImageShowWidget(
                      baseUrl: baseUrl + widget.idprooffiles,
                      widget: widget,
                      height: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Address Details
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Address Details',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Row(
                                        children: [
                                          Image.asset(
                                            KImage.address,
                                            height: 28,
                                          ),
                                          gapSize(0, 10),
                                          const Text("Address Details"),
                                        ],
                                      ),
                                      content: Form(
                                        key: _formKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: addressController,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                decoration: inputDecoaration(
                                                    hint: 'Address',
                                                    fillColor: ColorManager
                                                        .conatinerColors,
                                                    label: 'Address'),
                                              ),
                                              gapSize(15, 0),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: landMarkController,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                decoration: inputDecoaration(
                                                    hint: 'LandMark',
                                                    fillColor: ColorManager
                                                        .conatinerColors,
                                                    label: 'LandMark'),
                                              ),
                                              gapSize(15, 0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // ===================================
                                                  //////////////////////////////////////
                                                  //** This is For Country  Show  */ */
                                                  BlocBuilder<CountryCubit,
                                                      CountryState>(
                                                    builder: (context, state) {
                                                      if (state
                                                              is CountryCubit ||
                                                          state
                                                              is CountryLoading) {
                                                        return const CircularProgressIndicator();
                                                      } else if (state
                                                          is CountryLoaded) {
                                                        return Container(
                                                          width:
                                                              sizeData.width *
                                                                  0.14,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorManager
                                                                .conatinerColors,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  8),
                                                            ),
                                                          ),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton2<
                                                                    dynamic>(
                                                              isExpanded: true,
                                                              hint: Text(
                                                                'Select Country',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .hintColor,
                                                                ),
                                                              ),
                                                              items: state.name!
                                                                  .map(
                                                                    (item) =>
                                                                        DropdownMenuItem(
                                                                      value:
                                                                          item,
                                                                      child:
                                                                          Text(
                                                                        item,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                              value:
                                                                  countryData,
                                                              onChanged:
                                                                  (value) {
                                                                setState(
                                                                  () {
                                                                    stateData =
                                                                        null;
                                                                    countryData =
                                                                        value
                                                                            as String;
                                                                    print(
                                                                        "Country Data $countryData");
                                                                    countryId = state.id![state
                                                                        .name!
                                                                        .indexOf(
                                                                            countryData)];
                                                                    print(
                                                                        countryId);
                                                                    context
                                                                        .read<
                                                                            StateCubit>()
                                                                        .getState(
                                                                            '$countryId');
                                                                  },
                                                                );
                                                              },
                                                              // buttonStyleData:
                                                              //     const ButtonStyleData(
                                                              //   height: 40,
                                                              //   width: 200,
                                                              // ),
                                                              // dropdownStyleData:
                                                              //     const DropdownStyleData(
                                                              //   maxHeight: 200,
                                                              // ),
                                                              // menuItemStyleData:
                                                              //     const MenuItemStyleData(
                                                              //   height: 40,
                                                              // ),
                                                              dropdownSearchData:
                                                                  DropdownSearchData(
                                                                searchController:
                                                                    textEditingController,
                                                                searchInnerWidgetHeight:
                                                                    50,
                                                                searchInnerWidget:
                                                                    Container(
                                                                  height: 50,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 8,
                                                                    bottom: 4,
                                                                    right: 8,
                                                                    left: 8,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    expands:
                                                                        true,
                                                                    maxLines:
                                                                        null,
                                                                    controller:
                                                                        textEditingController,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      contentPadding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            8,
                                                                      ),
                                                                      hintText:
                                                                          'Search for an Country...',
                                                                      hintStyle:
                                                                          const TextStyle(
                                                                              fontSize: 12),
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                searchMatchFn:
                                                                    (item,
                                                                        searchValue) {
                                                                  return (item
                                                                      .value
                                                                      .toString()
                                                                      .toLowerCase()
                                                                      .contains(
                                                                          searchValue
                                                                              .toLowerCase()));
                                                                },
                                                              ),
                                                              //This to clear the search value when you close the menu
                                                              onMenuStateChange:
                                                                  (isOpen) {
                                                                if (!isOpen) {
                                                                  textEditingController
                                                                      .clear();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      return const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      );
                                                    },
                                                  ),

                                                  // ===================================
                                                  //////////////////////////////////////
                                                  //** This is For State Show  */ */
                                                  BlocBuilder<StateCubit,
                                                      StateState>(
                                                    builder: (context, state) {
                                                      if (state
                                                              is StateInitial ||
                                                          state
                                                              is StateLoading) {
                                                        return Container();
                                                      } else if (state
                                                          is StateLoaded) {
                                                        if (state.stateModel
                                                            .isEmpty) {
                                                          return const Text(
                                                              'No State Found');
                                                        }
                                                        return Container(
                                                          width:
                                                              sizeData.width *
                                                                  0.14,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorManager
                                                                .conatinerColors,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  8),
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              countryData ==
                                                                      null
                                                                  ? showErrorHUD(
                                                                      title:
                                                                          'Please Select Country')
                                                                  : null;
                                                            },
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton(
                                                                isExpanded:
                                                                    true,
                                                                hint: const Text(
                                                                    'Select State'),
                                                                value:
                                                                    stateData,
                                                                // Initial Value
                                                                // Down Arrow Icon
                                                                icon: const Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down),
                                                                // Array list of items
                                                                items: state
                                                                    .stateModel
                                                                    .map(
                                                                        (value) {
                                                                  return DropdownMenuItem(
                                                                    value: value
                                                                        .id,
                                                                    child: Text(
                                                                        value
                                                                            .name),
                                                                  );
                                                                }).toList(),
                                                                // After selecting the desired option,it will
                                                                // change button value to selected value
                                                                onChanged:
                                                                    countryData ==
                                                                            null
                                                                        ? null
                                                                        : (v) {
                                                                            setState(
                                                                              () {
                                                                                stateData = v.toString();
                                                                                // log(" Country Data $stateData");
                                                                                print(v);

                                                                                //  _countryList= s
                                                                              },
                                                                            );
                                                                          },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (state
                                                          is StateError) {
                                                        return Container();
                                                      }
                                                      return const Text('');
                                                    },
                                                  ),
                                                ],
                                              ),
                                              gapSize(15, 0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          districtController,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      decoration: inputDecoaration(
                                                          hint: 'District',
                                                          fillColor: ColorManager
                                                              .conatinerColors,
                                                          label: 'District'),
                                                    ),
                                                  ),
                                                  gapSize(0, 60),
                                                  Expanded(
                                                    child: TextFormField(
                                                      maxLength: 20,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      controller:
                                                          pinCodeController,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      decoration: inputDecoaration(
                                                          counterText: '',
                                                          hint: 'PinCode',
                                                          fillColor: ColorManager
                                                              .conatinerColors,
                                                          label: 'PinCode'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              gapSize(15, 0),
                                              // ===================================
                                              //////////////////////////////////////
                                              //**This is for using imagePicker package To get Image form System  */ */
                                              InkWell(
                                                onTap: () async {
                                                  try {
                                                    _paths2 = (await FilePicker
                                                            .platform
                                                            .pickFiles(
                                                      type: FileType.custom,
                                                      allowMultiple: false,
                                                      onFileLoading:
                                                          (FilePickerStatus
                                                                  status) =>
                                                              print(status),
                                                      allowedExtensions: [
                                                        'png',
                                                        'jpg',
                                                        'jpeg',
                                                        'heic'
                                                      ],
                                                    ))
                                                        ?.files;
                                                  } on PlatformException catch (e) {
                                                    print(
                                                        'Unsupported operation$e');
                                                  } catch (e) {
                                                    print(e.toString());
                                                  }
                                                  setState(() {
                                                    if (_paths2 != null) {
                                                      selectedImageByte2 =
                                                          _paths2!.first.bytes!;
                                                      //passing file bytes and file name for API call
                                                      imageFileName2 =
                                                          _paths2!.first.name;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  width: sizeData.width * 0.33,
                                                  height: 170,
                                                  decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .conatinerColors,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: selectedImageByte2 ==
                                                          null
                                                      ? DottedBorder(
                                                          borderType:
                                                              BorderType.RRect,
                                                          radius: const Radius
                                                              .circular(20),
                                                          dashPattern: const [
                                                            10,
                                                            10
                                                          ],
                                                          color: Colors.black,
                                                          strokeWidth: 1,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Icon(Icons
                                                                      .upload)
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                      'Upload your ID Card here')
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      : Image.memory(
                                                          selectedImageByte2!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                              ),
                                              gapSize(15, 0),
                                              ButtonWidget(
                                                text: 'Save',
                                                onPress: () async {
                                                  if (!_formKey.currentState!
                                                      .validate()) {
                                                    return;
                                                  } else if (addressController
                                                          .text.isEmpty ||
                                                      landMarkController
                                                          .text.isEmpty ||
                                                      districtController
                                                          .text.isEmpty ||
                                                      pinCodeController
                                                          .text.isEmpty ||
                                                      imageFileName2 == null) {
                                                    return showErrorHUD(
                                                        title:
                                                            'All Field required');
                                                  } else if (countryData ==
                                                      null) {
                                                    return showErrorHUD(
                                                        title:
                                                            'Please selected Country');
                                                  } else if (stateData ==
                                                      null) {
                                                    return showErrorHUD(
                                                        title:
                                                            'Please selected State');
                                                  }
                                                  _formKey.currentState!.save();
                                                  showLoading(
                                                      title: 'Loading...');
                                                  final pref =
                                                      await SharedPreferences
                                                          .getInstance();

                                                  ///** Check Weather the TextFom is all Fill all  */

                                                  final a = await chopper
                                                      .getService<
                                                          ProfileService>()
                                                      .getkycAddress(
                                                          addressController.text
                                                              .trim(),
                                                          landMarkController
                                                              .text
                                                              .trim(),
                                                          countryId!,
                                                          stateData!,
                                                          districtController
                                                              .text
                                                              .trim(),
                                                          pinCodeController.text
                                                              .trim());
                                                  if (a.body!.success ==
                                                      false) {
                                                    return showErrorHUD(
                                                        title: a.body!.message);
                                                  }
                                                  // ===================================
                                                  //////////////////////////////////////
                                                  //**This is for using Dio package To Upload MultiPart Image Upload to server  */ */
                                                  FormData formData =
                                                      FormData.fromMap(
                                                    {
                                                      "address_proof_file":
                                                          MultipartFile
                                                              .fromBytes(
                                                        _paths2!.first.bytes!,
                                                        filename:
                                                            _paths2!.first.name,
                                                        contentType: MediaType(
                                                            "image", "png"),
                                                      )
                                                    },
                                                  );

                                                  var response = await dio.post(
                                                      "https://register.neptunetourist.com/api/kycs/addressproof",
                                                      data: formData,
                                                      options: Options(
                                                          headers: {
                                                            "authorization":
                                                                "Bearer ${pref.getString('token')}"
                                                          }));
                                                  logger.d(
                                                      "addressProofImageUpload$response");
                                                  showSuccess(
                                                      title: a.body!.message);
                                                  context
                                                      .read<KycCubit>()
                                                      .refreshScreen();
                                                  context.router.pop();
                                                },
                                                height: 59,
                                                weight: double.infinity,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 15,
                            color: bodyTextColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    RickRowTextWidget(
                        dataText: "Address : ", dynamicText: widget.address),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: "LandMark : ", dynamicText: widget.landMark),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: "Country : ", dynamicText: widget.country),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: "State : ", dynamicText: widget.state),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: "District : ", dynamicText: widget.district),
                    gapSize(5, 0),
                    RickRowTextWidget(
                        dataText: "Pin code :", dynamicText: widget.pincode),
                    const Text(
                      'Address photo proof: ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ImageShowWidget(
                      baseUrl: baseUrl + widget.addressprooffiles,
                      widget: widget,
                      height: 250,
                      weight: 400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        // Small Screen
        if (ResponsiveLayoutPage.isMobile(context) ||
            ResponsiveLayoutPage.isMobileLarge(context))
          Column(
            children: [
              // Personal Details
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Personal Details',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                KImage.person,
                                                height: 28,
                                              ),
                                              gapSize(0, 10),
                                              const Text("Personal Details"),
                                            ],
                                          ),
                                          content: Form(
                                            key: _formKey,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  BlocBuilder<IdProofTypeCubit,
                                                      IdProofTypeState>(
                                                    builder: (context, state) {
                                                      if (state
                                                              is IdProofTypeInitial ||
                                                          state
                                                              is IdProofTypeLoading) {
                                                        return Container();
                                                      } else if (state
                                                          is IdProofTypeLoaded) {
                                                        final id = state
                                                            .idProofTypeModel;
                                                        return buildIdPaymentDropDown(
                                                            sizeData.width *
                                                                0.70,
                                                            id,
                                                            setState);
                                                      } else if (state
                                                          is IdProofTypeError) {
                                                        return const Center(
                                                            child: Text(
                                                                'Something Went Wrong'));
                                                      }
                                                      return const Center(
                                                        child: Text(''),
                                                      );
                                                    },
                                                  ),
                                                  gapSize(15, 0),
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: idController,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    decoration: inputDecoaration(
                                                        hint: 'Enter Id number',
                                                        fillColor: ColorManager
                                                            .conatinerColors,
                                                        label:
                                                            'Enter Id number'),
                                                  ),
                                                  gapSize(15, 0),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        _paths1 =
                                                            (await FilePicker
                                                                    .platform
                                                                    .pickFiles(
                                                          type: FileType.custom,
                                                          allowMultiple: false,
                                                          onFileLoading:
                                                              (FilePickerStatus
                                                                      status) =>
                                                                  print(status),
                                                          allowedExtensions: [
                                                            'png',
                                                            'jpg',
                                                            'jpeg',
                                                            'heic'
                                                          ],
                                                        ))
                                                                ?.files;
                                                      } on PlatformException catch (e) {
                                                        print(
                                                            'Unsupported operation$e');
                                                      } catch (e) {
                                                        print(e.toString());
                                                      }
                                                      setState(() {
                                                        if (_paths1 != null) {
                                                          selectedImageByte1 =
                                                              _paths1!
                                                                  .first.bytes!;
                                                          //passing file bytes and file name for API call
                                                          imageFileName1 =
                                                              _paths1!
                                                                  .first.name;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      width: double.infinity,
                                                      height: sizeData.height *
                                                          0.30,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager
                                                            .conatinerColors,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      child:
                                                          selectedImageByte1 ==
                                                                  null
                                                              ? DottedBorder(
                                                                  borderType:
                                                                      BorderType
                                                                          .RRect,
                                                                  radius: const Radius
                                                                      .circular(20),
                                                                  dashPattern: const [
                                                                    10,
                                                                    10
                                                                  ],
                                                                  color: Colors
                                                                      .black,
                                                                  strokeWidth:
                                                                      1,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: const [
                                                                          Icon(Icons
                                                                              .upload)
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: const [
                                                                          Text(
                                                                              'Upload your ID Card here')
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              : Image.memory(
                                                                  selectedImageByte1!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                    ),
                                                  ),
                                                  gapSize(15, 0),
                                                  SizedBox(
                                                    height: 59,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            ColorManager
                                                                .buttonColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        if (!_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          return;
                                                        } else if (imageFileName1 ==
                                                                null ||
                                                            paymentId == null ||
                                                            idController
                                                                .text.isEmpty) {
                                                          return showErrorHUD(
                                                              title:
                                                                  'All Field required');
                                                        }
                                                        _formKey.currentState!
                                                            .save();
                                                        showLoading(
                                                            title:
                                                                'Loading ...');
                                                        final pref =
                                                            await SharedPreferences
                                                                .getInstance();

                                                        final a = await chopper
                                                            .getService<
                                                                ProfileService>()
                                                            .getKycIdDoc(
                                                                payment:
                                                                    paymentId!,
                                                                idNumber:
                                                                    idController
                                                                        .text
                                                                        .trim());
                                                        if (a.body!.success ==
                                                            false) {
                                                          return showErrorHUD(
                                                              title: a.body!
                                                                  .message);
                                                        }
                                                        FormData formData =
                                                            FormData.fromMap(
                                                          {
                                                            "id_proof_file":
                                                                MultipartFile
                                                                    .fromBytes(
                                                              _paths1!
                                                                  .first.bytes!,
                                                              filename: _paths1!
                                                                  .first.name,
                                                              contentType:
                                                                  MediaType(
                                                                      "image",
                                                                      "png"),
                                                            )
                                                          },
                                                        );
                                                        var response =
                                                            await dio.post(
                                                                "https://register.neptunetourist.com/api/kycs/idproof",
                                                                data: formData,
                                                                options: Options(
                                                                    headers: {
                                                                      "authorization":
                                                                          "Bearer ${pref.getString('token')}"
                                                                    }));
                                                        logger.d(response
                                                            .statusMessage);
                                                        showSuccess(
                                                            title: a
                                                                .body!.message);
                                                        context
                                                            .read<KycCubit>()
                                                            .refreshScreen();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Save',
                                                        style: getTextStyle(
                                                          18,
                                                          FontWeight.w400,
                                                          Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 15,
                                color: ColorManager.neptuneText,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        RickRowTextWidget(
                            dataText: "ID Type ", dynamicText: widget.idType),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "ID Number : ",
                            dynamicText: widget.idNumber),
                        gapSize(5, 0),
                        RichText(
                            text: const TextSpan(
                                text: 'ID Photo Proof : ',
                                style: TextStyle(color: Colors.black54))),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image:
                                  NetworkImage(baseUrl + widget.idprooffiles),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: ResponsiveLayoutPage.isMobile(context)
                              ? 200
                              : 300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Address Details
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Address Details',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: Row(
                                            children: [
                                              Image.asset(
                                                KImage.address,
                                                height: 28,
                                              ),
                                              gapSize(0, 10),
                                              const Text("Address Details"),
                                            ],
                                          ),
                                          content: Form(
                                            key: _formKey,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        addressController,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    decoration: inputDecoaration(
                                                        hint: 'Address',
                                                        fillColor: ColorManager
                                                            .conatinerColors,
                                                        label: 'Address'),
                                                  ),
                                                  gapSize(15, 0),
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        landMarkController,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    decoration: inputDecoaration(
                                                        hint: 'LandMark',
                                                        fillColor: ColorManager
                                                            .conatinerColors,
                                                        label: 'LandMark'),
                                                  ),
                                                  gapSize(15, 0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      BlocBuilder<CountryCubit,
                                                          CountryState>(
                                                        builder:
                                                            (context, state) {
                                                          if (state
                                                                  is CountryCubit ||
                                                              state
                                                                  is CountryLoading) {
                                                            return Container();
                                                          } else if (state
                                                              is CountryLoaded) {
                                                            return Container(
                                                              width: sizeData
                                                                      .width *
                                                                  0.30,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorManager
                                                                    .conatinerColors,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton2<
                                                                        dynamic>(
                                                                  isExpanded:
                                                                      true,
                                                                  hint: Text(
                                                                    'Select Country',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .hintColor,
                                                                    ),
                                                                  ),
                                                                  items: state
                                                                      .name!
                                                                      .map(
                                                                        (item) =>
                                                                            DropdownMenuItem(
                                                                          value:
                                                                              item,
                                                                          child:
                                                                              Text(
                                                                            item,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                      .toList(),
                                                                  value:
                                                                      countryData,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                      () {
                                                                        stateData =
                                                                            null;
                                                                        countryData =
                                                                            value
                                                                                as String;
                                                                        countryId = state.id![state
                                                                            .name!
                                                                            .indexOf(countryData)];
                                                                        context
                                                                            .read<StateCubit>()
                                                                            .getState('$countryId');
                                                                      },
                                                                    );
                                                                  },
                                                                  // buttonStyleData:
                                                                  //     const ButtonStyleData(
                                                                  //   height: 40,
                                                                  //   width: 200,
                                                                  // ),
                                                                  // dropdownStyleData:
                                                                  //     const DropdownStyleData(
                                                                  //   maxHeight: 200,
                                                                  // ),
                                                                  // menuItemStyleData:
                                                                  //     const MenuItemStyleData(
                                                                  //   height: 40,
                                                                  // ),
                                                                  dropdownSearchData:
                                                                      DropdownSearchData(
                                                                    searchController:
                                                                        textEditingController,
                                                                    searchInnerWidgetHeight:
                                                                        50,
                                                                    searchInnerWidget:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        top: 8,
                                                                        bottom:
                                                                            4,
                                                                        right:
                                                                            8,
                                                                        left: 8,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        expands:
                                                                            true,
                                                                        maxLines:
                                                                            null,
                                                                        controller:
                                                                            textEditingController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          contentPadding:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                            vertical:
                                                                                8,
                                                                          ),
                                                                          hintText:
                                                                              'Search for an Country...',
                                                                          hintStyle:
                                                                              const TextStyle(fontSize: 12),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    searchMatchFn:
                                                                        (item,
                                                                            searchValue) {
                                                                      // print(
                                                                      //     "${item.value}");
                                                                      // print(
                                                                      //     "${searchValue}");
                                                                      return (item
                                                                          .value
                                                                          .toString()
                                                                          .toLowerCase()
                                                                          .contains(
                                                                              searchValue.toLowerCase()));
                                                                    },
                                                                  ),
                                                                  //This to clear the search value when you close the menu
                                                                  onMenuStateChange:
                                                                      (isOpen) {
                                                                    if (!isOpen) {
                                                                      textEditingController
                                                                          .clear();
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        },
                                                      ),
                                                      BlocBuilder<StateCubit,
                                                          StateState>(
                                                        builder:
                                                            (context, state) {
                                                          if (state
                                                                  is StateInitial ||
                                                              state
                                                                  is StateLoading) {
                                                            return Container();
                                                          } else if (state
                                                              is StateLoaded) {
                                                            return Container(
                                                              width: sizeData
                                                                      .width *
                                                                  0.30,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorManager
                                                                    .conatinerColors,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  countryData ==
                                                                          null
                                                                      ? showErrorHUD(
                                                                          title:
                                                                              'Please Select Country')
                                                                      : null;
                                                                },
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      DropdownButton(
                                                                    isExpanded:
                                                                        true,
                                                                    hint: const Text(
                                                                        'Select State'),
                                                                    value:
                                                                        stateData,
                                                                    // Initial Value
                                                                    // Down Arrow Icon
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down),
                                                                    // Array list of items
                                                                    items: state
                                                                        .stateModel
                                                                        .map(
                                                                            (value) {
                                                                      return DropdownMenuItem(
                                                                        value: value
                                                                            .id,
                                                                        child: Text(
                                                                            value.name),
                                                                      );
                                                                    }).toList(),
                                                                    // After selecting the desired option,it will
                                                                    // change button value to selected value
                                                                    onChanged: countryData ==
                                                                            null
                                                                        ? null
                                                                        : (v) {
                                                                            setState(
                                                                              () {
                                                                                stateData = v.toString();
                                                                                // log(" Country Data $stateData");
                                                                                //  _countryList= s
                                                                              },
                                                                            );
                                                                          },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else if (state
                                                              is StateError) {
                                                            return Container();
                                                          }
                                                          return const CircularProgressIndicator();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  gapSize(15, 0),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              districtController,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          decoration: inputDecoaration(
                                                              hint: 'District',
                                                              fillColor:
                                                                  ColorManager
                                                                      .conatinerColors,
                                                              label:
                                                                  'District'),
                                                        ),
                                                      ),
                                                      gapSize(0, 50),
                                                      Expanded(
                                                        child: TextFormField(
                                                          maxLength: 20,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              pinCodeController,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          decoration: inputDecoaration(
                                                              counterText: '',
                                                              hint: 'PinCode',
                                                              fillColor:
                                                                  ColorManager
                                                                      .conatinerColors,
                                                              label: 'PinCode'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  gapSize(15, 0),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        _paths2 =
                                                            (await FilePicker
                                                                    .platform
                                                                    .pickFiles(
                                                          type: FileType.custom,
                                                          allowMultiple: false,
                                                          onFileLoading:
                                                              (FilePickerStatus
                                                                      status) =>
                                                                  print(status),
                                                          allowedExtensions: [
                                                            'png',
                                                            'jpg',
                                                            'jpeg',
                                                            'heic'
                                                          ],
                                                        ))
                                                                ?.files;
                                                      } on PlatformException catch (e) {
                                                        print(
                                                            'Unsupported operation$e');
                                                      } catch (e) {
                                                        print(e.toString());
                                                      }
                                                      setState(() {
                                                        if (_paths2 != null) {
                                                          selectedImageByte2 =
                                                              _paths2!
                                                                  .first.bytes!;
                                                          //passing file bytes and file name for API call
                                                          imageFileName2 =
                                                              _paths2!
                                                                  .first.name;
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      width:
                                                          sizeData.width * 0.70,
                                                      height: 170,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager
                                                            .conatinerColors,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      child:
                                                          selectedImageByte2 ==
                                                                  null
                                                              ? DottedBorder(
                                                                  borderType:
                                                                      BorderType
                                                                          .RRect,
                                                                  radius: const Radius
                                                                      .circular(20),
                                                                  dashPattern: const [
                                                                    10,
                                                                    10
                                                                  ],
                                                                  color: Colors
                                                                      .black,
                                                                  strokeWidth:
                                                                      1,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: const [
                                                                          Icon(Icons
                                                                              .upload)
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: const [
                                                                          Text(
                                                                              'Upload your ID Card here')
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              : Image.memory(
                                                                  selectedImageByte2!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                    ),
                                                  ),
                                                  gapSize(15, 0),
                                                  ButtonWidget(
                                                    text: 'Save',
                                                    onPress: () async {
                                                      if (!_formKey
                                                          .currentState!
                                                          .validate()) {
                                                        return;
                                                      } else if (addressController
                                                              .text.isEmpty ||
                                                          landMarkController
                                                              .text.isEmpty ||
                                                          districtController
                                                              .text.isEmpty ||
                                                          pinCodeController
                                                              .text.isEmpty ||
                                                          imageFileName2 ==
                                                              null) {
                                                        return showErrorHUD(
                                                            title:
                                                                'All Field required');
                                                      } else if (countryData ==
                                                          null) {
                                                        return showErrorHUD(
                                                            title:
                                                                'Please select Country');
                                                      } else if (stateData ==
                                                          null) {
                                                        return showErrorHUD(
                                                            title:
                                                                'Please Select State');
                                                      }
                                                      _formKey.currentState!
                                                          .save();
                                                      showLoading(
                                                          title: 'Loading...');
                                                      final pref =
                                                          await SharedPreferences
                                                              .getInstance();

                                                      final a = await chopper
                                                          .getService<
                                                              ProfileService>()
                                                          .getkycAddress(
                                                              addressController
                                                                  .text
                                                                  .trim(),
                                                              landMarkController
                                                                  .text
                                                                  .trim(),
                                                              countryId!,
                                                              stateData!,
                                                              districtController
                                                                  .text
                                                                  .trim(),
                                                              pinCodeController
                                                                  .text
                                                                  .trim());
                                                      if (a.body!.success ==
                                                          false) {
                                                        return showErrorHUD(
                                                            title: a
                                                                .body!.message);
                                                      }

                                                      FormData formData =
                                                          FormData.fromMap(
                                                        {
                                                          "address_proof_file":
                                                              MultipartFile
                                                                  .fromBytes(
                                                            _paths2!
                                                                .first.bytes!,
                                                            filename: _paths2!
                                                                .first.name,
                                                            contentType:
                                                                MediaType(
                                                                    "image",
                                                                    "png"),
                                                          )
                                                        },
                                                      );

                                                      var response = await dio.post(
                                                          "https://register.neptunetourist.com/api/kycs/addressproof",
                                                          data: formData,
                                                          options: Options(
                                                              headers: {
                                                                "authorization":
                                                                    "Bearer ${pref.getString('token')}"
                                                              }));
                                                      logger.d(
                                                          "addressProofImageUpload$response");
                                                      showSuccess(
                                                          title:
                                                              a.body!.message);
                                                      context
                                                          .read<KycCubit>()
                                                          .refreshScreen();
                                                      context.router.pop();
                                                    },
                                                    height: 59,
                                                    weight: double.infinity,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 15,
                                color: bodyTextColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        RickRowTextWidget(
                            dataText: "Address : ",
                            dynamicText: widget.address),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "LandMark : ",
                            dynamicText: widget.landMark),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "Country : ",
                            dynamicText: widget.country),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "State : ", dynamicText: widget.state),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "District : ",
                            dynamicText: widget.district),
                        gapSize(5, 0),
                        RickRowTextWidget(
                            dataText: "Pin code :",
                            dynamicText: widget.pincode),
                        gapSize(5, 0),
                        RichText(
                            text: const TextSpan(
                                text: 'Address Photo Proof : ',
                                style: TextStyle(color: Colors.black54))),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  baseUrl + widget.addressprooffiles),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: ResponsiveLayoutPage.isMobile(context)
                              ? 250
                              : 350,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Container buildIdPaymentDropDown(
    double? weight,
    List<IdProofTypeModel> id,
    StateSetter setState,
  ) {
    return Container(
      width: weight,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorManager.conatinerColors,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,

          hint: const Text('Selected Id Proof'),
          // Initial Value
          // Down Arrow Icon
          value: paymentId,
          icon: const Icon(Icons.keyboard_arrow_down),
          // Array list of items
          items: id.map((v) {
            return DropdownMenuItem(
              value: v.id,
              child: Text(v.name),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (value) => setState(
            () => paymentId = value.toString(),
          ),
        ),
      ),
    );
  }
}
