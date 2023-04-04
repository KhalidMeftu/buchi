import 'package:buchi/const/app_font.dart';
import 'package:buchi/const/app_strings.dart';
import 'package:buchi/presentation/widgets/shared/app_bar.dart';
import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../routes/routes_manager.dart';
import 'common/adoptation_page/send_button.dart';

class AdoptationRequestPage extends StatefulWidget {
  const AdoptationRequestPage({Key? key}) : super(key: key);

  @override
  State<AdoptationRequestPage> createState() => _AdoptationRequestPageState();
}

class _AdoptationRequestPageState extends State<AdoptationRequestPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 8.0, right: 8.0),
            child: Text(
              AppStrings.weDontKnowHowToReach,
              textAlign: TextAlign.center,
              style: PetsFont.baseMedium().copyWith(
                  color: AppColors.blackColor,
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppStrings.placeNameAndPhone,
              textAlign: TextAlign.center,
              style: PetsFont.baseMedium().copyWith(
                color: AppColors.blackColor,
                fontSize: FontSize.s14,
              ),
            ),
          ),

          // name textfield
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.textFieldBgColor,
                shape: BoxShape.rectangle,
                 ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: AppStrings.hintName,
                  hintStyle: PetsFont.baseMedium()
                      .copyWith(color: AppColors.whiteColor),
                  errorText: _validate ? 'Name Can\'t Be Empty' : null,
                ),
              ),
            ),
          ),

          // phone numbwe
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.textFieldBgColor,
                shape: BoxShape.rectangle,
                  ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: AppStrings.phone,
                  hintStyle:
                      PetsFont.baseMedium().copyWith(color: AppColors.whiteColor),
                  errorText:
                      _validate ? '${AppStrings.phone} Can\'t Be Empty' : null,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(38.0),
            child: SendUserInfoButton(
              onTap: () {
                if (_nameController.text.isEmpty &&
                    _phoneController.text.isEmpty) {
                  setState(() {
                    _validate = true;
                  });
                }
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty) {
                  setState(() {
                    _validate = false;
                  });
                  // go to next page
                  Navigator.of(context)
                      .pushNamed(Routes.homePageRoute);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
