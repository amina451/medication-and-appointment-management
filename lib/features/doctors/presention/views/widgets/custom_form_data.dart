import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/biuld_border.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

class CustomFormAddData extends StatelessWidget {
  const CustomFormAddData({
    super.key,
    required this.hint,
    this.maxLength,
    this.controller,
    this.keyboardType, this.maxLines,
  });
  final String hint;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        hintMaxLines: maxLength,
        hintText: hint,
        focusedBorder: buildBorder(),
        disabledBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }
}
