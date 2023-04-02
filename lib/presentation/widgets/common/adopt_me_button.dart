import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes_manager.dart';

class SearchButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const SearchButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(80, 80),
      child: ClipOval(
        child: Material(
          color: AppColors.primaryColor,
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(Routes.homePageRoute);

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.search,size: IconSize.s75,color: AppColors.whiteColor,),
                title.isNotEmpty?
                Text(title, style: PetsFont.largeRegular()):
                Container(), // <-- Text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
