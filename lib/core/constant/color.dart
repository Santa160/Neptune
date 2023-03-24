import 'package:flutter/material.dart';

class ColorManager {
  static Color neptuneText = HexColor.formHex("#053742");
  static Color signText = HexColor.formHex("#053742");
  static Color backgroundColor = HexColor.formHex("#E8F0F2");
  static Color buttonColor = HexColor.formHex("#399E5A");
  static Color iconColor = HexColor.formHex("#717172");
  static Color bgColor = HexColor.formHex("0xFFE8F0F2");
  static Color conatinerColors = HexColor.formHex("#E8F0F2");
  static Color conatinerColorsTransfer = HexColor.formHex("#D8EEDF");

//** new colors */
  static Color darkPrimary = HexColor.formHex("#d17d11");
  static Color grey1 = HexColor.formHex("#707070");
  static Color grey2 = HexColor.formHex("#797979");
  static Color white = HexColor.formHex("#FFFFFF");
  static Color error = HexColor.formHex("#e61f34");
}

extension HexColor on Color {
  static Color formHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

const bgColor = Color(0xFFE8F0F2);
const bodyTextColor = Color(0xFF053742);
