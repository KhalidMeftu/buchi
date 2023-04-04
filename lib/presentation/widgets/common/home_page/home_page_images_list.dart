import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';

class HomePagePetsList extends StatelessWidget {
  final String imageUrl;
  final String petCategory;
  final String description;
  final int index;
  final Function onTap;

  const HomePagePetsList(
      {Key? key,
      required this.imageUrl,
      required this.petCategory,
      required this.description,
      required this.index,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       onTap.call();
      },
      child: SizedBox(
        height: 170,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7,
          color: AppColors.whiteColor,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (index % 2 == 0) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 170,
                    //width: 130,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        petCategory,
                        style: PetsFont.largeMedium().copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          description,
                          style: PetsFont.largeMedium().copyWith(
                              color: AppColors.blackColor,
                              fontSize: FontSize.s12),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        AppStrings.detail_description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: PetsFont.largeMedium().copyWith(
                            color: AppColors.textColor3,
                            fontSize: FontSize.s12),
                      )
                    ],
                  ),
                ),
              ] else ...[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          petCategory,
                          style: PetsFont.largeMedium().copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            description,
                            style: PetsFont.largeMedium().copyWith(
                                color: AppColors.blackColor,
                                fontSize: FontSize.s12),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Text(
                          AppStrings.detail_description,
                          style: PetsFont.largeMedium().copyWith(
                              color: AppColors.textColor3,
                              fontSize: FontSize.s12),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 170,
                    width: 130,
                    //width: 100,
                  ),
                ),
              ]

              // create column and display lists in it
            ],
          ),
        ),
      ),
    );
  }
}
