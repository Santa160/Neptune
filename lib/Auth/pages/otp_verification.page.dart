// import 'package:Neptune/core/helper/logger.dart';
// import 'package:Neptune/core/widget/eld.widget.dart';
// import 'package:Neptune/service/chopper_client.service.dart';
// import 'package:Neptune/service/chopper_service/Register/register.service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:pinput/pinput.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../core/core.dart';
// import '../example.dart';

// class OtpVerificationPage extends StatefulWidget {
//   const OtpVerificationPage({super.key});

//   @override
//   State<OtpVerificationPage> createState() => _OtpVerificationPageState();
// }

// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   final pinController = TextEditingController();
//   bool isEnable = true;
//   String? message;
//   @override
//   void initState() {
//     messageSponsor();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pinController.dispose();
//     super.dispose();
//   }

//   void messageSponsor() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       message = prefs.getString('message');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Colors.grey),
//       borderRadius: BorderRadius.circular(20),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Colors.white,
//       ),
//     );
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.asset(
//           KImage.logoImage,
//           fit: BoxFit.cover,
//           height: 43,
//         ),
//         gapSize(34, 10),
//         Row(
//           children: <Widget>[
//             Expanded(
//               child: Text(
//                 'Register your account',
//                 style: getTextStyle(
//                   25,
//                   FontWeight.w400,
//                   ColorManager.signText,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         gapSize(24, 0),
//         Row(
//           children: [
//             Flexible(
//               child: Text(
//                 message ?? "",
//                 style: getTextStyle(
//                   20,
//                   FontWeight.w400,
//                   ColorManager.signText,
//                 ),
//               ),
//             )
//           ],
//         ),
//         gapSize(10, 0),
//         Pinput(
//           controller: pinController,
//           length: 6,
//           showCursor: true,
//           defaultPinTheme: defaultPinTheme,
//           focusedPinTheme: focusedPinTheme,
//           submittedPinTheme: submittedPinTheme,
//         ),
//         gapSize(10, 0),
//         ButtonWidget(
//           text: 'Proceed',
//           onPress: () async {
//             if (pinController.text.length == 6) {
//               EasyLoading.show(status: 'Loading...');
//               final p = await chopper
//                   .getService<RegisterService>()
//                   .getSponsorVerify(body: {"code": pinController.text});
//               if (!p.isSuccessful) {
//                 showErrorHUD(title: p.body!.message);
//               }
//               if (p.body!.token == null) {
//                 showErrorHUD(title: p.body!.message);
//               }
//               if (p.body!.success == false) {
//                 showErrorHUD(title: p.body!.message);
//               }
//               final prefs = await SharedPreferences.getInstance();

//               prefs.setString('token', p.body!.token!);

//               prefs.setBool('left_node', p.body!.leftNode!);
//               prefs.setBool('right_node', p.body!.rightNode!);

//               logger.d(p.body!.toJson());

//               if (p.body!.success == true) {
//                 context.read<PageIndexCubit>().pageStatus(3);
//                 EasyLoading.dismiss();
//               }
//             } else if (pinController.text.length < 6) {
//               showErrorHUD(title: 'Please Enter 6 digit number');
//             }
//           },
//           height: 59,
//           weight: double.infinity,
//         ),
//       ],
//     );
//   }
// }
