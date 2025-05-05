import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/data_text_doctor.dart';
import 'package:pharmacy_app/core/widgets/date_text.dart';
import 'package:pharmacy_app/core/widgets/edit_button.dart';



class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.name,
    required this.specialty,
    this.address,
    required this.image,
    required this.date,
  });

  final String name, specialty, date, image;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 175.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.lightSecondryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, height: 87.h, width: 92.w),
              ),
              DataTextAndButtonRemove(
                name: name,
                specialty: specialty,
                experience: address!,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [DateVisitDoctor(date: date), EditButton()],
          ),
        ],
      ),
    );
  }
}
