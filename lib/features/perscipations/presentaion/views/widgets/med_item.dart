import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class MedicationItem extends StatelessWidget {
  const MedicationItem({
    super.key,
    required this.name,
    required this.instructions,
  });

  final String name;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.h,
          width: 2.w,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(32.sp),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyle.semiBold20.copyWith(
                fontSize: 16,
                height: 1.4,
              ),
            ),
            Text(
              instructions,
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.blueGrey.shade200,
                fontSize: 12,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
