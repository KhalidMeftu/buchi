import 'package:flutter/material.dart';
import 'app_colors.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
BorderRadius roundedBorderSmall = BorderRadius.circular(7);
BorderRadius roundedBorderMedium = BorderRadius.circular(15);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);

Widget spacedDivider = const Divider(color: Colors.blueGrey, height: 3.0);

Widget loadingSpinner = const Center(
  child: SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.headLineColors),
        strokeWidth: 3,
      )),
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
    {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
    {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double halfScreenHeight(BuildContext context) =>
    screenHeightFraction(context, dividedBy: 2);

double thirdScreenHeight(BuildContext context) =>
    screenHeightFraction(context, dividedBy: 3);


/// home screen image width
double homeScreenImageWidth(BuildContext context)=>
    screenWidthFraction(context, dividedBy:3);


/// home screen image height
double homeScreenImageHeight(BuildContext context)=>
    screenWidthFraction(context, dividedBy:3);


/// home oage column width

double homeScreenColumnWidth(BuildContext context)=>
    screenWidthFraction(context, dividedBy: 2);
