import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class InfoDoctor extends StatelessWidget {
  const InfoDoctor({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prescription #${index + 1}",
              style: AppTextStyle.semiBold20.copyWith(height: 0.2),
            ),
            Text(
              "Dr.Emily Johnson - Cardiologist",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.blueGrey.shade200,
                height: 0.8,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 40.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "Apr 20,2025",
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
