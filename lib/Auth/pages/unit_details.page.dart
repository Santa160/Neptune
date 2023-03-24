// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../Responsive/responsive.dart';
// import '../../core/core.dart';
// import '../example.dart';

// class UnitDetailsPage extends StatelessWidget {
//   const UnitDetailsPage({super.key});

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
//                           padding: EdgeInsets.all(87),
//                           child: UnitBankIndexPage()),
//                     )
//                   ],
//                 ),
//               if (ResponsiveLayoutPage.isMobile(context) ||
//                   ResponsiveLayoutPage.isMobileLarge(context))
//                 const Padding(
//                     padding: EdgeInsets.all(87), child: UnitBankIndexPage())
//             ],
//           ),
//         ));
//   }
// }

// class UnitBankIndexPage extends StatelessWidget {
//   const UnitBankIndexPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final p = context.watch<PageIndexCubit>();
//     final a = p.state;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ==============================================
//           if (a.index == 1) const SliderWidget(),
//           if (a.index == 2) const PaymentDetailsPage(),
//         ],
//       ),
//     );
//   }
// }
