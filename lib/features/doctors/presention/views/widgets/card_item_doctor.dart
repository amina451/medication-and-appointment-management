import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/data_text_doctor.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/date_visit_doctor.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/edit_button.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/remove_button.dart';

class CardItemDoctor extends StatelessWidget {
  const CardItemDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.lightSecondryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.assetsImagesDrSh,
                height: 87.h,
                width: 92.w,
              ),
              DataTextDoctor(),
          
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [DateVisitDoctor(), EditButton()],
          ),
        ],
      ),
    );
  }
}
