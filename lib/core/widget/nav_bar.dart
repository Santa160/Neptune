import 'dart:async';

import 'package:flutter/material.dart';

import '../core.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.rupee,
    required this.neptuneInitallValue,
    required this.startTimeStamp,
    required this.one_second_rupee,
    required this.dollar,
  });
  final String rupee;
  final String neptuneInitallValue;
  final String startTimeStamp;
  final String one_second_rupee;
  final String dollar;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  double? data;
  String? oneSecond;
  double neptuneValue = 0;
  double? newData;
  double dollar = 0;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    data = double.parse(widget.rupee);

    timeStamp();
  }

  void timeStamp() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      var t = DateTime.now().millisecondsSinceEpoch ~/
          Duration.microsecondsPerMillisecond;

      var e = int.parse(widget.startTimeStamp);
      var q = t - e;
      var r = double.parse(widget.one_second_rupee);
      var y = double.parse(widget.dollar);

      var p = q * r;

      var neptune = double.parse(widget.neptuneInitallValue);

      neptuneValue = neptune + p;
      dollar = neptuneValue / y;
      setState(() {});
    }
  }

  // void timeLife() async {
  //   String temp = '0.';
  //   List n = widget.rupee.toString().split(".");
  //   for (int i = 0; i <n[i].length ; i++) {
  //     if (i == neptuneValue! - 1) {
  //       temp = "${temp}1";
  //     } else {
  //       temp = "${temp}0";
  //     }
  //   }
  //   double n2 = double.parse(temp);

  //   while (true) {
  //     await Future.delayed(const Duration(seconds: 1));

  //     data = data! + n2;

  //     if (mounted) setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo here
        Image.asset(
          KImage.logoImage,
          width: 150,
        ),
        const Spacer(),
        Image.asset(
          KImage.coin,
          width: 30,
        ),
        // Unit here
        Text(
          "1 NU = ₹ ${neptuneValue.toStringAsFixed(6)} / \$ ${dollar.toStringAsFixed(8)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
