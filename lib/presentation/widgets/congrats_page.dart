import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/app_strings.dart';
import 'package:buchi/presentation/widgets/shared/app_bar.dart';
import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.congrats,
              style: PetsFont.extraExtraLargeBold().copyWith(
                  color: AppColors.primaryColor, fontSize: FontSize.s55,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),
          Text(AppStrings.meetingSetUp,
              style: PetsFont.baseMedium().copyWith(
                  color: AppColors.blackColor, fontSize: FontSize.s15)),
          const SizedBox(
            height: 20,
          ),
          Text(AppStrings.browseMore,
              style: PetsFont.baseMedium().copyWith(
                  color: AppColors.primaryColor, fontSize: FontSize.s15)),
        ],
      ),
    );
  }
}
