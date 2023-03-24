import 'package:Neptune/core/core.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoaration(
    {String? label,
    required String hint,
    IconButton? iconButton,
    IconButton? iconButtonSuffix,
    String? counterText,
    Color? fillColor}) {
  return InputDecoration(
    label: label != null
        ? Text(
            label,
          )
        : null,
    labelStyle: TextStyle(color: ColorManager.iconColor),
    // prefixIcon: Icon(Icons.email),
    filled: true,
    counterText: counterText,
    fillColor: fillColor,
    prefixIcon: iconButton,
    suffixIcon: iconButtonSuffix,
    hintText: hint,
    // hintStyle: TextStyle(color: ColorManager.neptuneText),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    // errorBorder: const OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.red, width: 1.0),
    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
    // ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}
