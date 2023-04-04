import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SearchDropDowns extends StatelessWidget {
  final Function onTap;
  final List<String> values;

  const SearchDropDowns({Key? key, required this.onTap, required this.values})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.arrow_drop_down),
      ),
      disabledHint: Text('By Location'),
      onTap: () {
        onTap;
        // TODO arrow state using bloc
      },
      items: values.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              FlutterSwitch(
                width: 70.0,
                height: 35.0,
                valueFontSize: 15.0,
                toggleSize: 25.0,
                value: value=='Dogs'?true:false,
                borderRadius: 10.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {},
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
