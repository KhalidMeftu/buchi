import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import '../../../const/app_colors.dart';

class HomePagePetsList extends StatelessWidget {
  final String imageUrl;
  final String petCategory;
  final String description;
  final String detailedDescription;
  final int index;
  final Function onTap;

  const HomePagePetsList(
      {Key? key,
      required this.imageUrl,
      required this.petCategory,
      required this.description,
      required this.detailedDescription,
      required this.index,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7,
        color: AppColors.whiteColor,
        child: Row(
          children: [
            // display my image
            if (index % 2 == 0) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    petCategory,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.blackColor, fontSize: FontSize.s16),
                  ),
                  Text(
                    petCategory,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.textColor3, fontSize: FontSize.s13),
                  )
                ],
              ),
            ] else ...[
              Column(
                children: [
                  Text(
                    petCategory,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.blackColor, fontSize: FontSize.s16),
                  ),
                  Text(
                    petCategory,
                    style: PetsFont.largeMedium().copyWith(
                        color: AppColors.textColor3, fontSize: FontSize.s13),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ]

            // create column and display lists in it
          ],
        ),
      ),
    );
  }
}
