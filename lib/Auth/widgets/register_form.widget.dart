// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../example.dart';

// class RegisterWidget extends StatelessWidget {
//   const RegisterWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ///Change page according to index
//     final p = context.watch<PageIndexCubit>();
//     final a = p.state;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (a.index == 1) const SponsoredPage(),
//           if (a.index == 2) const OtpVerificationPage(),
//           if (a.index == 3) const PersonalDetailsPage(),
//           // ==============================================
//         ],
//       ),
//     );
//   }
// }
