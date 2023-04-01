import 'package:buchi/const/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../const/app_font.dart';
import '../../const/app_strings.dart';
import '../../const/ui_helper.dart';
import 'common/adopt_me_button.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.appBackgroundColor,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(height: halfScreenHeight(context),child: Image.asset('assets/images/splash_dog.png', fit: BoxFit.cover,)),
                Positioned(
                    top:screenWidth(context)/10,
                    left: screenWidth(context)/15,
                    child: Text(AppStrings.splashDogsInAddis, style: PetsFont.largeMedium().copyWith(color: AppColors.whiteColor, fontSize: FontSize.s20, fontWeight: FontWeight.bold),))
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppStrings.splashPartOfSolution, style: PetsFont.smallMedium().copyWith(color: AppColors.blackColor, fontWeight: FontWeight.bold, fontSize: FontSize.s15),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppStrings.splashAdoptionMessage, style: PetsFont.smallMedium().copyWith(color: AppColors.blackColor,  fontSize: FontSize.s15),),
            ),

            Padding(
              padding:  EdgeInsets.only(top:screenHeight(context)/10),
              child: Center(
                child: SearchButton(title: '', onPressed:(){
                  if (kDebugMode) {
                    print('Clicked now');
                  }
                },),
              ),
            ),
          ],
        )
      ),
    );
  }
}
