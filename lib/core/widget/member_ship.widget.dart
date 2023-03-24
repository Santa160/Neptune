// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../Responsive/responsive_layout.dart';
// import '../constant/color.dart';
// import '../constant/constant.dart';
// import 'button.widget.dart';

// class MemberShipWidget extends StatelessWidget {
//   const MemberShipWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.backgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Image.asset(
//               KImage.logoImage,
//               height: 40,
//             ),
//           ),
//           if (ResponsiveLayoutPage.isDesktop(context) ||
//               ResponsiveLayoutPage.isExtraLarge(context) ||
//               ResponsiveLayoutPage.isTablet(context))
//             Center(
//               child: SizedBox(
//                 height: 280,
//                 width: 491,
//                 child: Card(
//                   elevation: 5,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Image.asset(
//                           KImage.check,
//                           height: 40,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Success',
//                           style: TextStyle(
//                               fontSize: 25, color: ColorManager.neptuneText),
//                         ),
//                         const Expanded(child: Text('')),
//                         ButtonWidget(
//                           text: 'OK',
//                           onPress: () {
//                             // context.router.navigate(const LoginRoute());
//                           },
//                           height: 37,
//                           weight: 143,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           if (ResponsiveLayoutPage.isMobile(context) ||
//               ResponsiveLayoutPage.isMobileLarge(context))
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Center(
//                 child: SizedBox(
//                   height: 280,
//                   width: 491,
//                   child: Card(
//                     elevation: 5,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             KImage.check,
//                             height: 40,
//                           ),
//                           Text(
//                             'Success',
//                             style: TextStyle(
//                                 fontSize: 25, color: ColorManager.neptuneText),
//                           ),
//                           const Text(''),
//                           gapSize(20, 0),
//                           ButtonWidget(
//                             text: 'OK',
//                             onPress: () async {
//                               final prefs =
//                                   await SharedPreferences.getInstance();
//                               prefs.remove('message');
//                               // context.router.push(LoginRoute());
//                               // context.router.navigate(const LoginRoute());
//                             },
//                             height: 47,
//                             weight: 143,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }
