import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.semiBold24.copyWith(fontSize: 20));
  }
}
