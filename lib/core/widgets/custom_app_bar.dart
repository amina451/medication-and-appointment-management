import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.28),
        Text(
          title,
          style: AppTextStyle.semiBold24.copyWith(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
