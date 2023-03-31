import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';

import '../../../const/app_colors.dart';
import '../../../const/ui_helper.dart';

class SearchResultsImagesList extends StatelessWidget {
  final String imageUrl;
  final String petCategory;
  final Function onTap;

  const SearchResultsImagesList(
      {Key? key,
      required this.imageUrl,
      required this.petCategory,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: thirdScreenHeight(context) / 3,
          width: double.infinity,
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [AppColors.whiteColor, Colors.transparent],
                          stops: [0.25, -1])),
                  child: Opacity(
                    opacity: 0.1,
                    child: Text(
                      petCategory.substring(0),
                      style: PetsFont.largeMedium().copyWith(
                          color: AppColors.whiteColor,
                          fontSize: FontSize.s44,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              // create column and display lists in it
            ],
          ),
        ),
      ),
    );
  }
}
