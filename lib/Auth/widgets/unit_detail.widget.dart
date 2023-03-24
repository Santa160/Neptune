// import 'package:flutter/material.dart';

// import 'package:Neptune/core/core.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../core/widget/button.widget.dart';
// import '../logic/pageIndex/page_index_cubit.dart';
// import '../logic/unit_buy/unit_buy_cubit.dart';

// class SliderWidget extends StatefulWidget {
//   const SliderWidget({super.key});

//   @override
//   State<SliderWidget> createState() => _SliderWidgetState();
// }

// class _SliderWidgetState extends State<SliderWidget> {
//   double _currentSliderValue = 200;

//   double? max;
//   double? min;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UnitBuyCubit, UnitBuyState>(
//       builder: (context, state) {
//         if (state is InitUnitBuyState || state is LoadingUnitBuyState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is LoadedUnitBuyState) {
//           final a = state.unitBoughtModel;
//           double inr = a.inr;
//           double usd = a.usd;

//           var z = inr * _currentSliderValue;
//           var p = usd * _currentSliderValue * inr;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(
//                 KImage.logoImage,
//                 fit: BoxFit.cover,
//                 height: 43,
//               ),
//               gapSize(34, 10),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Text(
//                       'Buy Units',
//                       style: getTextStyle(
//                         25,
//                         FontWeight.w400,
//                         ColorManager.signText,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               gapSize(24, 0),
//               SliderTheme(
//                 data: SliderThemeData(
//                   showValueIndicator: ShowValueIndicator.always,
//                   activeTrackColor: ColorManager.neptuneText,
//                   inactiveTrackColor: Colors.white,
//                   thumbColor: ColorManager.neptuneText,
//                   thumbShape:
//                       const RoundSliderThumbShape(enabledThumbRadius: 10),
//                   overlayShape: const RoundSliderOverlayShape(),
//                 ),
//                 child: Slider(
//                   // mouseCursor: MaterialState.focused.index.toString(),
//                   value: _currentSliderValue,
//                   min: a.min.toDouble(),
//                   max: a.max.toDouble(),

//                   divisions: 100,

//                   label: _currentSliderValue.toString(),
//                   onChanged: (double value) {
//                     setState(() {
//                       _currentSliderValue = value;
//                     });
//                   },
//                 ),
//               ),
//               gapSize(23, 0),
//               // Text(a.inr.toStringAsFixed(2) * _currentSliderValue.toInt()),
//               FittedBox(
//                 child: Row(
//                   children: [
//                     Text(
//                       'Total ₹ ${z.toStringAsFixed(2)}',
//                       style: getTextStyle(
//                         20,
//                         FontWeight.bold,
//                         ColorManager.neptuneText,
//                       ),
//                     ),
//                     gapSize(0, 5),
//                     Text(
//                       'or \$ ${p.toStringAsFixed(2)}',
//                       style: getTextStyle(
//                         20,
//                         FontWeight.bold,
//                         ColorManager.neptuneText,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               gapSize(10, 0),

//               ButtonWidget(
//                 text: 'Next',
//                 height: 59,
//                 weight: double.infinity,
//                 onPress: () {
//                   showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       content: Text(
//                         'Are you sure want to Buy ?',
//                         style: getTextStyle(
//                             20, FontWeight.w800, ColorManager.neptuneText),
//                       ),
//                       actions: [
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: ColorManager.buttonColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: const Text('Buy'),
//                           onPressed: () async {
//                             final prefs = await SharedPreferences.getInstance();
//                             prefs.setDouble(
//                                 "currentSlider", _currentSliderValue);
//                             prefs.setDouble("rupee", z);

//                             context.read<PageIndexCubit>().pageStatus(2);
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: ColorManager.buttonColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: const Text('Close me!'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               )
//             ],
//           );
//         }
//         return Center(
//           child: Text(state.toString()),
//         );
//       },
//     );
//   }
// }
