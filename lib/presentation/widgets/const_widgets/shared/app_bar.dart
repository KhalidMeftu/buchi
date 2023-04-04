import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';

import '../../../../const/app_strings.dart';


Widget petsAppBar() {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    centerTitle: true,
    title: Text(
      AppStrings.buchi,
      style: PetsFont.largeMedium().copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[

      IconButton(
        icon: const Icon(Icons.list, color: AppColors.blackColor,),
        onPressed: () {
          //action for user icon button
        },
      )
    ],
  );
}
