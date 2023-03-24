import 'package:flutter/material.dart';

import '../../core/core.dart';

class ContainerTextFormFieldWidget extends StatelessWidget {
  const ContainerTextFormFieldWidget({
    Key? key,
    required this.sizeData,
    required this.landMarkController,
    required this.text,
    this.height,
  }) : super(key: key);

  final double sizeData;
  final double? height;
  final TextEditingController landMarkController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeData,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorManager.conatinerColors,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextFormField(
        controller: landMarkController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
