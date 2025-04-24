import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class DateVisitDoctor extends StatelessWidget {
  const DateVisitDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Next Available ",
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "12:00",
                  style: AppTextStyle.semiBold12.copyWith(color: Colors.black),
                ),
                TextSpan(
                  text: " AM tomorrow",
                  style: AppTextStyle.semiBold12.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
