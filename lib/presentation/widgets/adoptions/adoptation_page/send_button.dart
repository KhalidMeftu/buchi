import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/app_strings.dart';
import 'package:flutter/material.dart';

class SendUserInfoButton extends StatelessWidget {
  final Function onTap;

  const SendUserInfoButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {onTap.call();},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        child: Text(
          AppStrings.send,
          style: PetsFont.smallMedium().copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
