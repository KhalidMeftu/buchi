import 'package:buchi/const/app_colors.dart';
import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';


class SearchButton extends StatelessWidget {
  final Function onPressed;

  const SearchButton({Key? key,  required this.onPressed})
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
             onPressed.call();

            },
            child: const Icon(Icons.search,size: IconSize.s75,color: AppColors.whiteColor,),
          ),
        ),
      ),
    );
  }
}
