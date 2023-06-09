import 'package:buchi/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/app_font.dart';
import '../../../const/app_strings.dart';
import '../../../const/ui_helper.dart';
import '../../../routes/routes_manager.dart';
import '../../controller/network_bloc/internet_bloc.dart';
import '../const_widgets/adopt_me_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBackgroundColor,
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if(state is ConnectedState) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: halfScreenHeight(context),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash_dog.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          AppStrings.splashDogsInAddis,
                          style: PetsFont.largeMedium().copyWith(
                              color: AppColors.whiteColor,
                              fontSize: FontSize.s20,
                              fontWeight: FontWeight.bold),
                        ),
                      )) // Foreground widget here
              ),
              const SizedBox(
                height: 30,
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
                  child: SearchButton(onPressed: () {
                    goToHomePage(context);
                  }),
                ),
              ),
            ],
          );
          }
          if(state is NotConnectedState)
            {
              return Center(child: Text(AppStrings.noInternate, style: PetsFont.largeMedium().copyWith(color: AppColors.primaryColor),));
            }
          return Center(child: Text(AppStrings.noInternate, style: PetsFont.largeMedium().copyWith(color: AppColors.primaryColor),));
        },
      ),
    );
  }

  void goToHomePage(context) {
    Navigator.of(context).pushReplacementNamed(Routes.homePageRoute);
  }
}
