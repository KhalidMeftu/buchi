import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/app_strings.dart';
import '../../../../const/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomePageLivePetsList extends StatelessWidget {
  final String imageUrl;
  final String petCategory;
  final String description;
  final Function onTap;

  const HomePageLivePetsList(
      {Key? key,
        required this.imageUrl,
        required this.petCategory,
        required this.description,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: SizedBox(
        height: homeScreenImageHeight(context),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7,
          color: AppColors.whiteColor,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                imageUrl.isEmpty?ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/place_holder.png',
                    fit: BoxFit.fitHeight,
                    height: homeScreenImageHeight(context),
                    width: homeScreenImageWidth(context),

                  ),
                ):
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const SizedBox(height:30, width:30,child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: homeScreenImageHeight(context),
                    width: homeScreenImageWidth(context),
                  ),
                ),
                SizedBox(
                  width: homeScreenColumnWidth(context),
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
                      Flexible(
                        child: Text(
                          AppStrings.detail_description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: PetsFont.largeMedium().copyWith(
                              color: AppColors.textColor3,
                              fontSize: FontSize.s12),
                        ),
                      )
                    ],
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
