import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '';
import 'app_colors.dart';

class AppFonts {


  static TextStyle appBarTextStyle({Color color = AppColors.headLineColors}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.bold, fontSize: 30
    );
  }

  static TextStyle cardPetNameTextStyle(
      {Color color = AppColors.headLineColors}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 20
    );
  }

  static TextStyle cardPetDescTextStyle({Color color = AppColors.blackColor}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 16
    );
  }


  static TextStyle cardPetDescTextStyle2({Color color = AppColors.textColor3}) {
    return GoogleFonts.robotoMono(
        color: color, fontWeight: FontWeight.w100, fontSize: 10
    );
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
  class PetsFont{

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

