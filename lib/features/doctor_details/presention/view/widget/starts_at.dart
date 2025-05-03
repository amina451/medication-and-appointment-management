import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class StartsAt extends StatelessWidget {
  const StartsAt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Starts at",
          style: AppTextStyle.semiBold12.copyWith(
            color: AppColor.primaryColor,
            height: 0.8,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(Icons.alarm, size: 16),
            Text("10:30am-5:30pm", style: AppTextStyle.semiBold12),
          ],
        ),
      ],
    );
  }
}
