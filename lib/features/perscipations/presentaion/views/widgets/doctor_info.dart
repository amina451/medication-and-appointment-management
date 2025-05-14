import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class InfoDoctor extends StatelessWidget {
  const InfoDoctor({
    super.key,
    required this.index,
    required this.doctorName,
    required this.speciality,
    required this.date,
  });

  final int index;
  final String doctorName;
  final String speciality;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prescription #${index + 1}",
              style: AppTextStyle.semiBold20.copyWith(height: 0.2),
            ),
            Text(
              "Dr. $doctorName - $speciality",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.blueGrey.shade200,
                height: 1.2,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 40.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            date,
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
