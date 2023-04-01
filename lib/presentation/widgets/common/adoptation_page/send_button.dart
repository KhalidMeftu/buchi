import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/app_strings.dart';
import 'package:flutter/material.dart';

class SendUserInfoButton extends StatelessWidget {
  final Function onTap;

  const SendUserInfoButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: RawMaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        onPressed: () {
          onTap;
        },
        child: Text(
          AppStrings.send,
          style: PetsFont.smallMedium().copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
