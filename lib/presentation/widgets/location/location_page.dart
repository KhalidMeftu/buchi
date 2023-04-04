
import 'package:buchi/const/app_font.dart';
import 'package:flutter/material.dart';

import '../../../const/app_strings.dart';
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.locationBased, textAlign: TextAlign.center, style: PetsFont.baseMedium(),),
    );
  }
}
