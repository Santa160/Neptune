import 'package:flutter/material.dart';

class RickRowTextWidget extends StatelessWidget {
  const RickRowTextWidget({
    Key? key,
    required this.dataText,
    required this.dynamicText,
  }) : super(key: key);

  final String dataText;
  final String dynamicText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              text: dataText,
              style: TextStyle(color: Colors.black54),
              children: [
                TextSpan(
                    text: dynamicText, style: TextStyle(color: Colors.black))
              ]),
        ),
      ],
    );
  }
}
