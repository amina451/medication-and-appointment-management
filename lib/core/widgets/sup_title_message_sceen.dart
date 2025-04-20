import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class SupTitleMessage extends StatelessWidget {
  const SupTitleMessage({super.key, required this.supTitle});

  final String supTitle;
  @override
  Widget build(BuildContext context) {
    return Text(supTitle, style: AppTextStyle.semiBold12);
  }
}
