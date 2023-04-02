import 'package:flutter/material.dart';
class AdoptationTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FormFieldValidator validate;
  const AdoptationTextField({Key? key, required this.hintText, required this.onChanged, required this.controller, required this.validate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: TextEditingController(),
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );
  }
}
