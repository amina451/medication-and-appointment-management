import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class DateVisitDoctor extends StatelessWidget {
  const DateVisitDoctor({super.key,  this.date});
  final String ? date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Phone call",
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          Text("+213 123 456 789",
              style: AppTextStyle.semiBold12.copyWith(
                color: AppColor.primaryColor,
              )),
          
        ],
      ),
    );
  }
}
