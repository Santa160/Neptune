import 'package:flutter/material.dart';

import '../core.dart';

class SponsorCardWidget extends StatelessWidget {
  const SponsorCardWidget(
      {super.key,
      required this.sponsorId,
      required this.sponsorName,
      required this.downlineId,
      required this.downlineName});
  final String sponsorId;
  final String sponsorName;
  final String downlineId;
  final String downlineName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 3, left: 10, bottom: 10),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            KImage.sponsorIcon,
            height: 55,
          ),
        ),
        richTextBuild(dataText: 'Sponsor ID : ', apiText: sponsorId),
        gapSize(3, 0),
        richTextBuild(dataText: 'Sponsor Name : ', apiText: sponsorName),
        gapSize(5, 0),
        richTextBuild(dataText: 'UpLineID : ', apiText: downlineId),
        gapSize(5, 0),
        richTextBuild(dataText: 'UpLine Name : ', apiText: downlineName),
      ]),
    );
  }
}

Widget richTextBuild({required String dataText, required String apiText}) {
  return RichText(
    text: TextSpan(
      text: dataText,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.black54,
        overflow: TextOverflow.ellipsis,
      ),
      children: [
        TextSpan(
            text: apiText,
            style: const TextStyle(
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    ),
  );
}
