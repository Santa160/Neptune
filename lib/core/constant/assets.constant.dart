import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class KImage {
  static const String aadhaarImage = 'assets/images/aadhaar.jpg';
  static const String addressImage = 'assets/images/address.png';
  static const String alertImage = 'assets/images/alert.png';
  static const String genologyImage = 'assets/images/genology.png';
  static const String homeImage = 'assets/images/home.png';
  static const String logoImage = 'assets/images/logo.png';

  static const String phaseImage = 'assets/images/phase.png';
  static const String pocketImage = 'assets/images/pocket.png';
  static const String profileImage = 'assets/images/profile.png';
  static const String regsiterPhoto = 'assets/images/project2.jpg';
  static const String loginImage = 'assets/images/project3.jpg';
  static const String someImage = 'assets/images/project4.jpg';
  static const String promotionImage = 'assets/images/promotion.png';
  static const String signOutImage = 'assets/images/sign-out.png';
  static const String transferImage = 'assets/images/transfer.png';

  static const String coinImage = 'assets/images/wall1.png';
  static const String walletImage = 'assets/images/wallet.png';
  static const String person = 'assets/images/person_blue.png';
  static const String address = 'assets/images/address_dark_blue.png';
  static const String check = 'assets/images/check.png';
  static const String coin = 'assets/images/coin.png';
  static const String transaction = 'assets/images/transaction.png';

  static const String withdraw = 'assets/images/withdraw.png';
  static const String addMember = 'assets/images/add member.png';
  static const String memberList = 'assets/images/member list.png';
  static const String transferList = 'assets/images/transfer list.png';
  static const String withdrawList = 'assets/images/withdraw list.png';
  static const String sponsorIcon = 'assets/images/sponsorEditor.png';
}

const defaultPadding = 20.0;
const imageSize = 40.0;
const alertColor = Color(0xFFFFF0C8);

gapSize(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

TextStyle getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.jaldi(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal);
}
