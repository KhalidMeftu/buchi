import 'package:buchi/const/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  static TextStyle appBarTextStyle({Color color = AppColors.headLineColors}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.bold, fontSize: 30);
  }

  static TextStyle cardPetNameTextStyle(
      {Color color = AppColors.headLineColors}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 20);
  }

  static TextStyle cardPetDescTextStyle({Color color = AppColors.blackColor}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 16);
  }

  static TextStyle cardPetDescTextStyle2({Color color = AppColors.textColor3}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 10);
  }
}

TextStyle _baseFont({
  Color color = Colors.black,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return GoogleFonts.plusJakartaSans(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}

class PetsFont {
  static TextStyle extraExtraSmallRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  static TextStyle extraExtraSmallMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
  }

  static TextStyle extraExtraSmallSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );
  }

  static TextStyle extraExtraSmallBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 12,
    );
  }

  static TextStyle extraSmallRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle extraSmallMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  static TextStyle extraSmallSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }

  static TextStyle extraSmallBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }

  static TextStyle smallRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }

  static TextStyle smallMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 17,
    );
  }

  static TextStyle smallSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 17,
    );
  }

  static TextStyle smallBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 17,
    );
  }

  static TextStyle baseRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );
  }

  static TextStyle baseMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );
  }

  static TextStyle baseSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );
  }

  static TextStyle baseBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );
  }

  static TextStyle largeRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 24,
    );
  }

  static TextStyle largeMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 24,
    );
  }

  static TextStyle largeSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 24,
    );
  }

  static TextStyle largeBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );
  }

  static TextStyle extraLargeRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 26,
    );
  }

  static TextStyle extraLargeMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 26,
    );
  }

  static TextStyle extraLargeSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 26,
    );
  }

  static TextStyle extraLargeBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 26,
    );
  }

  static TextStyle extraExtraLargeRegular() {
    return _baseFont(
      fontWeight: FontWeight.w400,
      fontSize: 30,
    );
  }

  static TextStyle extraExtraLargeMedium() {
    return _baseFont(
      fontWeight: FontWeight.w500,
      fontSize: 30,
    );
  }

  static TextStyle extraExtraLargeSemiBold() {
    return _baseFont(
      fontWeight: FontWeight.w600,
      fontSize: 30,
    );
  }

  static TextStyle extraExtraLargeBold() {
    return _baseFont(
      fontWeight: FontWeight.w700,
      fontSize: 30,
    );
  }
}

class FontSize {
  static const double s7 = 7.0;
  static const double s8 = 8.0;
  static const double s9 = 9.0;
  static const double s10 = 10.0;
  static const double s11 = 11.0;
  static const double s12 = 12.0;
  static const double s13 = 13.0;
  static const double s14 = 14.0;
  static const double s15 = 15.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s19 = 19.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s35 = 35.0;
  static const double s40 = 40.0;
  static const double s44 = 44.0;
  static const double s55 = 55.0;

}

class IconSize {
  static const double s10 = 10.0;
  static const double s15 = 15.0;
  static const double s20 = 20.0;
  static const double s25 = 25.0;
  static const double s30 = 30.0;
  static const double s35 = 35.0;
  static const double s40 = 40.0;
  static const double s45 = 45.0;
  static const double s75 = 75.0;
}


class Paddings{
  static const double s10 = 10.0;
  static const double s15 = 15.0;
  static const double s20 = 20.0;
  static const double s25 = 25.0;
  static const double s30 = 30.0;
  static const double s35 = 35.0;
  static const double s40 = 40.0;
  static const double s45 = 45.0;
  static const double s50 = 50.0;


}



