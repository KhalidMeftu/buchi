import 'package:buchi/presentation/widgets/detail_screen/pets_details/image_slider.dart';
import 'package:buchi/presentation/widgets/detail_screen/pets_details/pet_description_bottom_description.dart';
import 'package:flutter/material.dart';
import '../../../const/app_colors.dart';
import '../../../data/model/pets_model.dart';
import '../../../routes/routes_manager.dart';
import '../const_widgets/shared/app_bar.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageSlider(imagesList: imageList.isEmpty?[]:imageList),
              )),
          PetDetailsBottomView(
            petName: type,
            childrenStatus: notGoodWChildren,
            age: age,
            gender: gender,
            size: size,
            onTap: () {

              Navigator.of(context)
                  .pushReplacementNamed(Routes.adoptPageRoute);
            },
          )
        ],
      ),
    );
  }
}
