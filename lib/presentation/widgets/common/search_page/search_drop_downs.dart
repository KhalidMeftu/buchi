import 'package:flutter/material.dart';
class SearchDropDowns extends StatelessWidget {
  final Function onTap;
  final List<String> values;

  const SearchDropDowns({Key? key, required this.onTap, required this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap:(){
        onTap;
        // TODO arrow state using bloc
      },

      items: values.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
