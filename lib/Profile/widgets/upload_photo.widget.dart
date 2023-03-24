import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class UploadPhotoWidget extends StatelessWidget {
  const UploadPhotoWidget({
    Key? key,
    required this.sizeData,
    required this.height,
  }) : super(key: key);

  final double sizeData;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: sizeData,
      height: height,
      decoration: BoxDecoration(
        color: ColorManager.conatinerColors,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          color: Colors.black,
          strokeWidth: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.upload)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Upload your ID Card here')],
              )
            ],
          )),
    );
  }
}
