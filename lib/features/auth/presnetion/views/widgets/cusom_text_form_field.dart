import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/biuld_border.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.keyboardType,
    required this.hint,
    this.icon,
    this.colorHint,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.onSaved,
     this.suffixIcon,
  });
  final TextInputType? keyboardType;
  final String hint;
  final IconData? icon;
  final Color? colorHint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: AppColor.lightSecondryColor,
        filled: true,
        hintText: hint,
        hintStyle: AppTextStyle.semiBold12.copyWith(
          fontSize: 16,
          color: colorHint ?? AppColor.hintColor,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        disabledBorder: buildBorder(),
      ),
    );
  }
}
