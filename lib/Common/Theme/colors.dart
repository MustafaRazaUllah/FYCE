import 'package:flutter/material.dart';

class AppColor {
  // appcolors._();
  static const Color transparent = Color(0xff000000);
  static const Color onboard = Color(0xff24E2B0);
  static const Color switchColor = Color(0xff6CDFB3);
  static const Color strokeGrey = Color(0xff343434);
// ! App BTN Colors
  static const Color userBTN = Color(0xff0EBE7E);
  static const Color doctorBTN = Color(0xff08A9E4);
  static const Color companyBTN = Color(0xffFF5050);
// ! App Colors
  static const Color border = Color(0xff856C3F);
  static const Color primaryColor = Color(0xff121111);
  static const Color textFieldBorder = Color(0x0ff67729);
  static const Color sheetTopBar = Color(0xffc4c4c4);
// !Rendom Colors
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF33cc66);
  static const Color orange = Color(0xFFF7931A);
  static const Color red = Color(0xFFFF3131);
// ! Text Colors
  static const Color darkText = Color(0xFF1D2733);
  static const Color greyText = Color(0xff5A5A5A);
  static const Color greyLightShade = Color(0xff6C727F);
  

  // ! TextField Colors
  static const Color textFieldColor = Color(0xffF9F9FC);

  // ! Button Colors
  static const Color popupColor = Color(0xff1E1E1E);
  static const Color popUpButtonColor = Color(0xffE4E4E4);

  // ! wellats Colors
  static const Color greyLight = Color(0xff979797);
  static const Color black54color = Color(0xff353434);
  


  
}

class FontWeights {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
