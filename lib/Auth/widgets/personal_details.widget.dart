// import 'dart:developer';

// import 'package:Neptune/core/helper/logger.dart';
// import 'package:Neptune/core/widget/eld.widget.dart';
// import 'package:Neptune/core/widget/input_decoration.widget.dart';

// import 'package:Neptune/router/router.dart';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// import 'package:Neptune/core/core.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../service/chopper_client.service.dart';
// import '../../service/chopper_service/Register/register.service.dart';
// import '../example.dart';

// class PersonalDetailsWidget extends StatefulWidget {
//   const PersonalDetailsWidget({
//     super.key,
//   });

//   @override
//   State<PersonalDetailsWidget> createState() => _PersonalDetailsWidgetState();
// }

// class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool? leftNode;
//   bool? rightNode;
//   // bool onError = false;

//   String? _selectRadio;
//   String? token;

//   @override
//   void initState() {
//     super.initState();
//     nodeStatus();
//   }

//   void nodeStatus() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       leftNode = prefs.getBool('left_node');
//       log('Left Node $leftNode');
//       rightNode = prefs.getBool('right_node');
//       log('Right Node$rightNode');
//       token = prefs.getString('token');
//     });
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Personal Details'),
//           gapSize(11, 0),
//           TextFormField(
//             controller: nameController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Name can\'t be Empty';
//               }
//               return null;
//             },
//             decoration: inputDecoaration(
//               hint: 'Name',
//             ),
//           ),

//           gapSize(19, 0),
//           TextFormField(
//             controller: emailController,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Email can\'t be empty';
//               }
//               if (!value.contains('@')) {
//                 return 'Email contains @ required';
//               }
//               return null;
//             },
//             decoration: inputDecoaration(
//               hint: 'Email',
//             ),
//           ),
//           // TextFormFieldContainerWidget(
//           //   keyboardType: TextInputType.emailAddress,
//           //   icon: Icons.email,
//           //   hinText: 'Email',
//           //   textEditingController: emailController,
//           //   validator: (value) {
//           //     setState(() {
//           //       onError = false;
//           //     });
//           //     if (value!.isEmpty) {
//           //       setState(() {
//           //         onError = true;
//           //       });
//           //       return null;
//           //     }
//           //     return null;
//           //   },
//           // ),
//           // onError
//           //     ? const Positioned(
//           //         bottom: 0,
//           //         child: Text(
//           //           'Email can\'t be empty',
//           //           style: TextStyle(color: Colors.red),
//           //         ),
//           //       )
//           //     : Container(),
//           gapSize(19, 0),
//           TextFormField(
//             controller: phoneController,
//             decoration: inputDecoaration(
//               hint: 'Mobile Number',
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Mobile number can\'t be empty';
//               }
//               return null;
//             },
//           ),
//           // TextFormFieldContainerWidget(
//           //     keyboardType: TextInputType.phone,
//           //     icon: Icons.phone,
//           //     hinText: 'Mobile Number',
//           //     textEditingController: phoneController,
//           //     validator: (value) {
//           //       setState(() {
//           //         onError = false;
//           //       });
//           //       if (value!.isEmpty) {
//           //         setState(() {
//           //           onError = true;
//           //         });
//           //         return null;
//           //       }
//           //       return null;
//           //     }),
//           // onError
//           //     ? const Positioned(
//           //         bottom: 0,
//           //         child: Text(
//           //           'Mobile number can\'t be empty',
//           //           style: TextStyle(color: Colors.red),
//           //         ))
//           //     : Container(),

//           gapSize(15, 0),

//           Row(
//             children: [
//               Radio<String>(
//                 value: 'left',
//                 groupValue: _selectRadio,
//                 onChanged: leftNode == false
//                     ? null
//                     : (value) => setState(() => _selectRadio = value),
//               ),
//               const Text(
//                 'left',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//               gapSize(0, 10),
//               Radio<String>(
//                   value: 'right',
//                   groupValue: _selectRadio,
//                   onChanged: rightNode == false
//                       ? null
//                       : (value) => setState(() => _selectRadio = value)),
//               const Text(
//                 'Right',
//                 style: TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//           gapSize(10, 0),
//           // ButtonWidget(text: 'Save')
//           ButtonWidget(
//             text: 'Save',
//             onPress: () async {
//               if (!_formKey.currentState!.validate()) {
//                 return;
//               } else if (_selectRadio == null) {
//                 return;
//               }
//               _formKey.currentState!.save();
//               EasyLoading.show(status: 'Loading...');
//               final r = await chopper
//                   .getService<RegisterService>()
//                   .getAccountRegister(body: {
//                 'token': token,
//                 'name': nameController.text.trim(),
//                 'email': emailController.text.trim(),
//                 'phone': phoneController.text.trim(),
//                 'node': _selectRadio
//               });
//               logger.d(r.body!.toJson());
//               if (r.body!.success == false) {
//                 showErrorHUD(
//                   title: r.body!.message.toString(),
//                 );
//               }
//               if (r.body!.success == true) {
//                 final prefs = await SharedPreferences.getInstance();

//                 final a = await prefs.setString(
//                     'message', r.body!.message.toString());

//                 context.router.navigate(
//                   const SuccessWidgetRoute(),
//                 );
//                 EasyLoading.dismiss();
//               }
//             },
//             height: 59,
//             weight: double.infinity,
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget buildTextFormField(String hintText, IconData icon) {
//   return Container(
//     height: 59,
//     padding: const EdgeInsets.all(5),
//     decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(8))),
//     child: TextFormField(
//       textAlignVertical: TextAlignVertical.center,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon
//             // color: Colors.white,
//             ),
//         hintText: hintText,
//         border: InputBorder.none,
//         fillColor: Colors.white,
//       ),
//     ),
//   );
// }
