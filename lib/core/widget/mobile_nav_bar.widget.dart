import 'package:flutter/material.dart';

import '../core.dart';

class MobileNavBarWidget extends StatefulWidget {
  const MobileNavBarWidget({
    required this.rupee,
    required this.neptuneInitallValue,
    required this.startTimeStamp,
    required this.one_second_rupee,
    required this.dollar,
    super.key,
  });
  final String rupee;
  final String neptuneInitallValue;
  final String startTimeStamp;
  final String one_second_rupee;
  final String dollar;

  @override
  State<MobileNavBarWidget> createState() => _MobileNavBarWidgetState();
}

class _MobileNavBarWidgetState extends State<MobileNavBarWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              KImage.logoImage,
              width: 150,
            ),

            // Unit here
          ],
        ),
        Row(
          children: [
            Image.asset(
              KImage.coin,
              width: 30,
            ),
            Text(
              "1 NU = ₹ ${neptuneValue.toStringAsFixed(6)} / \$ ${dollar.toStringAsFixed(8)}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
