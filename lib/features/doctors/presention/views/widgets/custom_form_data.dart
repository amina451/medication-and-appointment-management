import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/biuld_border.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

class CustomFormAddData extends StatelessWidget {
  const CustomFormAddData({super.key, required this.hint,  this.maxLength});
  final String hint;
  final int ?maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        hintMaxLines:maxLength ,
        hintText: hint,
        focusedBorder: buildBorder(),
        disabledBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }
}
