import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';

class AdoptMeButton extends StatelessWidget {
  //final String title;
  final Function onPressed;

  const AdoptMeButton({Key? key,  required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(80, 80),
      child: Material(
        //color: AppColors.primaryColor,
        child: InkWell(
          onTap: () {
            onPressed.call();
          },
          child: const Icon(Icons.favorite,size: IconSize.s75,color: AppColors.primaryColor,),
        ),
      ),
    );
  }
}
