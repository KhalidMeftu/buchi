import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../const/app_colors.dart';
import '../../../routes/routes_manager.dart';
import '../const_widgets/shared/app_bar.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.congrats,
                style: PetsFont.extraExtraLargeBold().copyWith(
                    color: AppColors.primaryColor, fontSize: FontSize.s35,
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
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .pushNamed(Routes.homePageRoute);
              },
              child: Text(AppStrings.browseMore,
                  style: PetsFont.baseMedium().copyWith(
                      color: AppColors.primaryColor, fontSize: FontSize.s15)),
            ),
          ],
        ),
      ),
    );
  }
}
