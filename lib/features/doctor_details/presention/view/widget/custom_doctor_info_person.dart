import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomDoctorInfoPerson extends StatelessWidget {
  const CustomDoctorInfoPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("David H. Brown", style: AppTextStyle.semiBold20),
            Spacer(),
            Text("+213 123 456 789", style: AppTextStyle.semiBold20),
          ],
        ),
        Text(
          "Psychologists | Apollo hospital",
          style: AppTextStyle.semiBold12.copyWith(
            color: Colors.grey.shade400,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
