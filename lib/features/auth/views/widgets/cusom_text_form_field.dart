import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/biuld_border.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.hint,
    this.icon,
    this.colorHint,
  });
  final TextInputType keyboardType;
  final String hint;
  final IconData? icon;
  final Color? colorHint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        fillColor: AppColor.lightSecondryColor,
        filled: true,
        hintText: hint,
        hintStyle: AppTextStyle.semiBold20.copyWith(
          color: colorHint ?? AppColor.hintColor,
        ),
        enabledBorder: biuldBorder(),
        focusedBorder: biuldBorder(),
        disabledBorder: biuldBorder(),
      ),
    );
  }
}
