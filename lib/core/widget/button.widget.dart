import 'package:flutter/material.dart';

import '../core.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPress,
      required this.height,
      this.weight});
  final String text;
  final Function() onPress;
  final double? height;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: weight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: getTextStyle(
            18,
            FontWeight.w400,
            Colors.white,
          ),
        ),
      ),
    );
  }
}
