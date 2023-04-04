import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/ui_helper.dart';
import '../../../../data/model/pets_model.dart';

class SearchResultsImagesList extends StatelessWidget {
  final List<Photo> imageUrl;
  final int index;
  final String petCategory;
  final Function onTap;

  const SearchResultsImagesList(
      {Key? key,
      required this.imageUrl,
      required this.petCategory,
      required this.onTap,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            if (imageUrl.isNotEmpty) ...{
              for (var img in imageUrl) ...[
                /// sometimes the response have url but no url string in it it needs to be checked
                img.url!.isEmpty
                    ? SizedBox(
                        height: thirdScreenHeight(context),
                        child: displayImage(),
                      )
                    : SizedBox(
                        height: thirdScreenHeight(context),
                        child: Image.network(
                          img.url.toString(),
                          fit: BoxFit.cover,
                          width: double.infinity,

                          // width: double.infinity,
                          //height: 240,
                        ),
                      ),
              ],
            },
            if (imageUrl.isEmpty) ...{
              // Image.asset('assets/images/place_holder.png',fit:BoxFit.fitWidth),
              SizedBox(
                height: thirdScreenHeight(context),
                child: displayImage(),
              ),
            },

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 70,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColors.ghostWhite,
                    AppColors.transParentColor,
                  ],
                  stops: [0.75, 1],
                )),
                child: Center(
                  child: Opacity(
                    opacity: 0.1,
                    child: Text(
                      petCategory[0],
                      style: PetsFont.largeMedium().copyWith(
                          //color: AppColors.whiteColor,
                          fontSize: FontSize.s44,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            // create column and display lists in it
          ],
        ),
      ),
    );
  }

  Image displayImage() {
    return Image.asset(
      'assets/images/place_holder.png',
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
