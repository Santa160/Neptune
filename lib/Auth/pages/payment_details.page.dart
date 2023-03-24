// import 'dart:developer';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import '../../core/core.dart';
// import '../../core/helper/logger.dart';
// import '../../core/widget/eld.widget.dart';
// import '../../service/chopper_client.service.dart';
// import '../../service/chopper_service/login/login.service.dart';
// import '../example.dart';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';

// class PaymentDetailsPage extends StatefulWidget {
//   const PaymentDetailsPage({super.key});

//   @override
//   State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
// }

// class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
//   String? dropdownValue;
//   // bool? required;

//   // variable to hold image to be displayed

//   double? amount;
//   double? unitAmount;

//   Uint8List? selectedImageInByte;
//   var dio = Dio();

//   TextEditingController bankRefController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? nameMode;
//   List<int>? selectedFile;
//   List<PlatformFile>? _paths;
//   String? imageFile;
//   @override
//   void initState() {
//     getAmountData();
//     super.initState();
//   }

// //** */ Get Data form SharePref to get rupee and currentSlider value
//   void getAmountData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final double? decimal = prefs.getDouble('rupee');
//     final double? unit = prefs.getDouble('currentSlider');
//     setState(() {
//       amount = decimal;
//       unitAmount = unit;
//     });
//   }

//   // startWebFile() async {
//   //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//   //   uploadInput.multiple = false;
//   //   uploadInput.draggable = false;
//   //   uploadInput.click();
//   //   uploadInput.onChange.listen((event) {
//   //     final files = uploadInput.files;
//   //     final file = files![0];
//   //     final reader = html.FileReader();
//   //     reader.onLoadEnd.listen((event) {
//   //       setState(() {
//   //         selectedImageInByte = const Base64Decoder()
//   //             .convert(reader.result.toString().split(",").last);
//   //         selectedFile = selectedImageInByte;
//   //       });
//   //     });
//   //     reader.readAsDataUrl(file);
//   //   });
//   // }

//   // Future upload() async {
//   //   var url = Uri.https('https://staging.neptunetourist.com/api/members/buy');
//   //   var request = http.MultipartRequest("Post", url);
//   //   request.files.add(
//   //     http.MultipartFile.fromBytes('receipt', selectedFile!,
//   //         contentType: MediaType('application', 'json'), filename: 'png'),
//   //   );
//   //   request.send().then((value) {
//   //     if (value.statusCode == 200) {
//   //       print('Ok');
//   //     } else {
//   //       print('Fail');
//   //     }
//   //   });
//   // }

// //** File_Picker package use to get Image or File in Byte */
//   void pickFiles() async {
//     try {
//       _paths = (await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowMultiple: false,
//         onFileLoading: (FilePickerStatus status) => print(status),
//         allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
//       ))
//           ?.files;
//     } on PlatformException catch (e) {
//       log('Unsupported operation$e');
//     } catch (e) {
//       log(e.toString());
//     }
//     setState(() {
//       if (_paths != null) {
//         selectedImageInByte = _paths!.first.bytes!;
//         //passing file bytes and file name for API call
//         imageFile = _paths!.first.name;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BankAccountCubit, BankAccountState>(
//       builder: (context, state) {
//         if (state is InitBankAccount || state is LoadingBankAccount) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is LoadedBankAccount) {
//           final a = state.bankAccountModel;
//           final pay = a.paymentModes;

//           // for (var buy in pay) {
//           //   logger.w(buy.requireReceipt);
//           // }
//           // for (var i = 0; i < pay.length; i++) {
//           //   print(pay[i].name);
//           // }
//           return Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   KImage.logoImage,
//                   fit: BoxFit.cover,
//                   height: 43,
//                 ),
//                 gapSize(34, 10),
//                 Text(amount.toString()),
//                 Text(unitAmount.toString()),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Text(
//                         'Register your account',
//                         style: getTextStyle(
//                           25,
//                           FontWeight.w400,
//                           ColorManager.signText,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Text(
//                         'Payment Details',
//                         style: getTextStyle(
//                           20,
//                           FontWeight.w400,
//                           ColorManager.signText,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 gapSize(10, 0),
//                 Table(
//                   children: [
//                     TableRow(
//                       children: [
//                         const Text('Bank Name'),
//                         Text(a.bankName),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         const Text('IFSC'),
//                         Text(a.ifsc),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         const Text('Branch Name'),
//                         Text(a.bankName),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         const Text('Account Name'),
//                         Text(a.accountNo),
//                       ],
//                     ),
//                     TableRow(
//                       children: [
//                         const Text('Account Holder Name'),
//                         Text(a.accountHolderName),
//                       ],
//                     ),
//                   ],
//                 ),
//                 gapSize(24, 0),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(8),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton(
//                       value: dropdownValue,
//                       hint: const Text('Select Payment mode'),
//                       // Initial Value
//                       // Down Arrow Icon
//                       icon: const Icon(Icons.keyboard_arrow_down),
//                       // Array list of items
//                       items: pay.map((pays) {
//                         return DropdownMenuItem(
//                           value: pays.name,
//                           child: Text(
//                             pays.name,
//                           ),
//                         );
//                       }).toList(),

//                       // After selecting the desired option,it will
//                       // change button value to selected value
//                       onChanged: (value) {
//                         setState(() {
//                           dropdownValue = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 gapSize(10, 0),
//                 if (pay[1].name == dropdownValue)
//                   buildContainer(context, bankRefController),
//                 gapSize(10, 0),
//                 if (pay[1].name == dropdownValue)
//                   InkWell(
//                     onTap: () => pickFiles(),
//                     child: Container(
//                       padding: const EdgeInsets.all(15),
//                       width: double.infinity,
//                       height: 170,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20),
//                         ),
//                       ),
//                       child: selectedImageInByte == null
//                           ? DottedBorder(
//                               padding: const EdgeInsets.all(20),
//                               borderType: BorderType.RRect,
//                               radius: const Radius.circular(20),
//                               dashPattern: const [10, 10],
//                               color: Colors.black,
//                               strokeWidth: 1,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [Icon(Icons.upload)],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       Text('Upload your Id Card here')
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : Image.memory(
//                               selectedImageInByte!,
//                               fit: BoxFit.fill,
//                             ),
//                     ),
//                   ),
//                 gapSize(10, 0),
//                 ButtonWidget(
//                   text: 'Submit',
//                   onPress: () async {
//                     if (!_formKey.currentState!.validate()) {
//                       return;
//                     } else if (imageFile == null) {
//                       return;
//                     }
//                     _formKey.currentState!.save();
//                     if (dropdownValue == null) {
//                       return showErrorHUD(title: 'Please select payment mode');
//                     }
//                     final pref = await SharedPreferences.getInstance();
//                     EasyLoading.show(status: 'Loading...');
//                     try {
//                       //** Pay in Cash using Chopper*/
//                       if (pay[0].name == dropdownValue) {
//                         final p = await chopper
//                             .getService<LoginService>()
//                             .uploadPhoto(
//                                 unitAmount!, pay[0].id, null, null, amount!);
//                         pref.setString('message', p.body!.message);
//                         logger.d(p.body!.message);
//                         if (p.body!.success == true) {
//                           // context.router.navigate(const SideBarRouter());
//                         } else if (p.body!.success == false) {
//                           showErrorHUD(title: p.body!.message);
//                         }

//                         showSuccess(title: p.body!.message);
//                       }
//                       //** Pay in Bank Account using dio package */
//                       if (pay[1].name == dropdownValue) {
//                         FormData formData = FormData.fromMap(
//                           {
//                             "units": unitAmount!.toStringAsFixed(2),
//                             "payment_mode": pay[1].id,
//                             "reference_no": bankRefController.text.trim(),
//                             "amount": amount!.toStringAsFixed(2),
//                             "receipt": MultipartFile.fromBytes(
//                               _paths!.first.bytes!,
//                               filename: _paths!.first.name,
//                               contentType: MediaType("image", "png"),
//                             )
//                           },
//                         );

//                         var response = await dio.post(
//                             "https://staging.neptunetourist.com/api/members/buy",
//                             data: formData,
//                             options: Options(headers: {
//                               "authorization":
//                                   "Bearer ${pref.getString('token')}"
//                             }));
//                         logger.d(response.data.toString());
//                         if (response.statusCode == 200) {
//                           // context.router.navigate(const SideBarRouter());
//                         } else {
//                           showErrorHUD(
//                               title: response.statusMessage.toString());
//                         }
//                         showSuccess(title: response.statusMessage.toString());
//                       }
//                     } catch (error) {
//                       showErrorHUD(title: error.toString());
//                     }
//                   },
//                   height: 59,
//                   weight: double.infinity,
//                 )
//               ],
//             ),
//           );
//         }
//         return Center(
//           child: Text(state.toString()),
//         );
//       },
//     );
//   }
// }

// Widget buildContainer(BuildContext context, TextEditingController bankRef) {
//   return TextFormField(
//     controller: bankRef,
//     validator: (value) {
//       if (value!.isEmpty) {
//         return 'Enter Transaction number';
//       }
//       return null;
//     },
//     decoration: const InputDecoration(
//       labelStyle: TextStyle(color: Colors.black),
//       // prefixIcon: Icon(Icons.email),
//       filled: true,
//       fillColor: Colors.white,

//       hintText: 'Enter Transaction number ',
//       // hintStyle: TextStyle(color: ColorManager.neptuneText),
//       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
//       border: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey, width: 1.0),
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.white, width: 1.0),
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       ),
//       // errorBorder: const OutlineInputBorder(
//       //   borderSide: BorderSide(color: Colors.red, width: 1.0),
//       //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       // ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.white, width: 1.0),
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       ),
//     ),
//   );
// }

// Widget buildContainerUpload(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.all(15),
//     width: double.infinity,
//     height: 170,
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.all(
//         Radius.circular(20),
//       ),
//     ),
//     child: DottedBorder(
//       padding: const EdgeInsets.all(20),
//       borderType: BorderType.RRect,
//       radius: const Radius.circular(20),
//       dashPattern: const [10, 10],
//       color: Colors.black,
//       strokeWidth: 1,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.upload),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [Text('Upload your Id Card here')],
//           ),
//         ],
//       ),
//     ),
//   );
// }
