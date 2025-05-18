import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class DateVisitDoctor extends StatelessWidget {
  const DateVisitDoctor({super.key, this.forme});
  final String? forme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Némuro de téléphone",
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            forme!,
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
