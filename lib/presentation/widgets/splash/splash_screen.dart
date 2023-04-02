import 'package:buchi/const/app_colors.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/app_font.dart';
import '../../../const/app_strings.dart';
import '../../../const/service/service_locator.dart';
import '../../../const/ui_helper.dart';
import '../../../routes/routes_manager.dart';
import '../common/adopt_me_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetsListBloc(sLocator())..add(GetPetsListEvent()),
      lazy: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.appBackgroundColor,
        body: SizedBox.expand(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                    height: halfScreenHeight(context),
                    child: Image.asset(
                      'assets/images/splash_dog.png',
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: screenWidth(context) / 10,
                    left: screenWidth(context) / 15,
                    child: Text(
                      AppStrings.splashDogsInAddis,
                      style: PetsFont.largeMedium().copyWith(
                          color: AppColors.whiteColor,
                          fontSize: FontSize.s20,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.splashPartOfSolution,
                style: PetsFont.smallMedium().copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.s15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.splashAdoptionMessage,
                style: PetsFont.smallMedium().copyWith(
                    color: AppColors.blackColor, fontSize: FontSize.s15),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight(context) / 10),
              child: Center(
                child: SearchButton(
                  title: '',
                  onPressed: (){
                   goToHomePage(context);
                  }
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void goToHomePage(context) {
    Navigator.of(context)
        .pushReplacementNamed(Routes.homePageRoute);
  }
}
