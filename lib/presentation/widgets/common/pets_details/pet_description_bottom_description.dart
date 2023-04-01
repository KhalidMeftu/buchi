import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/ui_helper.dart';
import 'package:flutter/material.dart';
import '../../../../const/app_strings.dart';
import 'adopt_me_button.dart';

class PetDetailsBottomView extends StatelessWidget {
  final String petName;
  final String childrenStatus;
  final String age;
  final String gender;
  final String size;
  final Function onTap;

  const PetDetailsBottomView(
      {Key? key,
      required this.petName,
      required this.childrenStatus,
      required this.age,
      required this.gender,
      required this.size,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackgroundColor,
      height: halfScreenHeight(context),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              petName,
              style: PetsFont.largeRegular()
                  .copyWith(color: AppColors.primaryColor),
            ),
            spacedDivider,
            Text(
              childrenStatus,
              style:
                  PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
            ),
            spacedDivider,
            Text(
              'Age:$petName',
              style:
                  PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
            ),
            spacedDivider,
            Text(
              'Gender:$gender',
              style:
                  PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
            ),
            spacedDivider,
            Text(
              'Size:$size',
              style:
                  PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
            ),
            spacedDivider,
            Center(
                child: AdoptMeButton(
              title: AppStrings.adoptMe,
              onPressed: () {},
            ))
          ],
        ),
      ),
    );
  }
}
