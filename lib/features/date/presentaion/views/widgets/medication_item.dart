import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class MedicationItem extends StatelessWidget {
  const MedicationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8.w,
      children: [
        Container(
          height: 50.h,
          width: 0.8.w,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(32.sp),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amoxicillin-500mg",
              style: AppTextStyle.semiBold20.copyWith(
                fontSize: 16,
                height: 1.4,
              ),
            ),
            Text(
              "1pill twice dilly for 10 days",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.blueGrey.shade200,
                fontSize: 12,
                height: 0.8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
