import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/auth/views/widgets/form_title.dart';

class CustomCardInfoDateItem extends StatelessWidget {
  const CustomCardInfoDateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTitle(title: "Today,April 26"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10),

            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Dr.Emily Johnson",
                      style: AppTextStyle.semiBold20.copyWith(height: 0.2),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, size: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, size: 18),
                    ),
                  ],
                ),
                Text(
                  "Cardiologist",
                  style: AppTextStyle.semiBold12.copyWith(
                    color: Colors.blueGrey.shade200,
                    height: 0.8,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 20.w),
                Row(
                  children: [
                    Icon(Icons.alarm, size: 18),
                    Text("3:30 PM"),
                    SizedBox(width: 10.w),
                    Icon(Icons.location_on, size: 18),
                    Text("Heart Center Clinic"),
                  ],
                ),
                Spacer(),
                Text(
                  "Follow-up appointment For blood pressure check",
                  style: AppTextStyle.semiBold12.copyWith(
                    color: Colors.blueGrey.shade200,
                    height: 0.8,
                    fontSize: 14,
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
