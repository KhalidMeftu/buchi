import 'package:flutter/material.dart';
import '../../../const/app_colors.dart';
import '../../../data/model/pets_model.dart';
import '../common/pets_details/image_slider.dart';
import '../common/pets_details/pet_description_bottom_description.dart';
import '../shared/app_bar.dart';

class DetailScreenPage extends StatelessWidget {
  final String type;
  final bool notGoodWChildren;
  final String age;
  final String gender;
  final String size;
  final List<Photo> imageList;

  const DetailScreenPage(
      {Key? key,
      required this.type,
      required this.notGoodWChildren,
      required this.age,
      required this.gender,
      required this.size,
      required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: ListView(
        children: [
          Container(
              color: AppColors.appBackgroundColor,
              height: 182,
              //width: 200,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ImageSlider(imagesList: imageList),
              )),
          PetDetailsBottomView(
            petName: type,
            childrenStatus: notGoodWChildren,
            age: age,
            gender: gender,
            size: size,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
