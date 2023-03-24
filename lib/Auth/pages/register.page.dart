// import 'package:flutter/material.dart';
// import 'package:Neptune/Responsive/responsive_layout.dart';

// import '../../core/core.dart';
// import '../widgets/register_form.widget.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorManager.backgroundColor,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               if (ResponsiveLayoutPage.isDesktop(context) ||
//                   ResponsiveLayoutPage.isTablet(context) ||
//                   ResponsiveLayoutPage.isExtraLarge(context))
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       width: MediaQuery.of(context).size.width * 0.60,
//                       child: Image.asset(
//                         KImage.regsiterPhoto,
//                         fit: BoxFit.fill,
//                         height: double.infinity,
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.40,
//                       height: MediaQuery.of(context).size.height,
//                       child: const Padding(
//                         padding: EdgeInsets.all(87),
//                         child: RegisterWidget(),
//                       ),
//                     )
//                   ],
//                 ),
//               if (ResponsiveLayoutPage.isMobile(context) ||
//                   ResponsiveLayoutPage.isMobileLarge(context))
//                 const Padding(
//                   padding: EdgeInsets.all(87),
//                   child: RegisterWidget(),
//                 )
//             ],
//           ),
//         ));
//   }
// }
