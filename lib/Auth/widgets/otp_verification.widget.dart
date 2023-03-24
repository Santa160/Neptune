// import 'package:flutter/material.dart';

// import '../../core/core.dart';

// class OtpVerificationWidget extends StatelessWidget {
//   const OtpVerificationWidget({super.key, required this.controller});
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FittedBox(
//           child: Row(
//             children: [
//               Text(
//                 'OTP has been send to Sponsored ID Phone Number',
//                 style: getTextStyle(
//                   20,
//                   FontWeight.w400,
//                   ColorManager.signText,
//                 ),
//               )
//             ],
//           ),
//         ),
//         gapSize(10, 0),
//         FittedBox(
//           child: Wrap(
//             alignment: WrapAlignment.start,
//             spacing: 15,
//             direction: Axis.horizontal,
//             runSpacing: 1,
//             children: [
//               _otpTextField(context, false, controller),
//               _otpTextField(context, false, controller),
//               _otpTextField(context, false, controller),
//               _otpTextField(context, false, controller),
//               _otpTextField(context, false, controller),
//               _otpTextField(context, false, controller),
//             ],
//           ),
//         ),
//         gapSize(24, 0),
//       ],
//     );
//   }
// }

// Widget _otpTextField(
//     BuildContext context, bool autoFocus, TextEditingController controller) {
//   return Container(
//     width: 50,
//     height: 50,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.grey),
//       borderRadius: BorderRadius.circular(15),
//       color: Colors.white,
//       shape: BoxShape.rectangle,
//     ),
//     child: AspectRatio(
//       aspectRatio: 1,
//       child: TextField(
//         // controller: controller,
//         // autofocus: autoFocus,
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//         ),
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         style: const TextStyle(),
//         maxLines: 1,
//         onChanged: (value) {
//           if (value.isNotEmpty) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//       ),
//     ),
//   );
// }
