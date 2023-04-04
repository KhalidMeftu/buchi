import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/ui_helper.dart';
import 'package:flutter/material.dart';
import '../../../../const/app_strings.dart';
import 'adopt_me_button.dart';

class PetDetailsBottomView extends StatelessWidget {
  final String petName;
  final bool childrenStatus;
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                petName,
                style: PetsFont.largeRegular()
                    .copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            spacedDivider,
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                childrenStatus.toString(),
                style:
                    PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
              ),
            ),
            spacedDivider,
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Age:$age',
                style:
                    PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
              ),
            ),
            spacedDivider,
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Gender:$gender',
                style:
                    PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
              ),
            ),
            spacedDivider,
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Size:$size',
                style:
                    PetsFont.smallMedium().copyWith(color: AppColors.blackColor),
              ),
            ),
            spacedDivider,
            Center(
                child: AdoptMeButton(
                  onPressed: () {
                /// go to user information filling
                    onTap.call();
              },
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: Center(child: Text(AppStrings.adoptMe, style: PetsFont.largeRegular().copyWith(color: AppColors.primaryColor))),
            )
          ],
        ),
      ),
    );
  }
}
