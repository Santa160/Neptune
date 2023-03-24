import 'package:flutter/material.dart';

class TextFormFieldContainerWidget extends StatelessWidget {
  const TextFormFieldContainerWidget({
    super.key,
    required this.icon,
    required this.hinText,
    required this.textEditingController,
    this.keyboardType,
    required this.validator,
  });
  final IconData icon;
  final String hinText;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hinText,
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
