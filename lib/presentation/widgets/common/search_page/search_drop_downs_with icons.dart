import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../../const/app_strings.dart';
class SearchDropDownsWithIcons extends StatelessWidget {
  final Function onTap;
   const SearchDropDownsWithIcons({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.arrow_drop_down),
          ),
          onTap:(){
            onTap;
            // TODO arrow state using bloc
          },

          items: <String>[AppStrings.dogs, AppStrings.cats, AppStrings.others].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),

      ],
    );
  }
}
