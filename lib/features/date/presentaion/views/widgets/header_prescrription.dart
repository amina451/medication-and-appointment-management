import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/custom_search_anochr.dart';

class HeaderPrescription extends StatelessWidget {
  const HeaderPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text(
              "Prescriptions",
              style: AppTextStyle.semiBold20.copyWith(
                color: Colors.white,
                height: 0.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manage Your Prescriptions ",
                  style: AppTextStyle.semiBold20.copyWith(
                    color: AppColor.secondaryColor,
                    height: 0.2,
                    fontSize: 12.sp,
                  ),
                ),
                Container(
                  height: 40,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((0.25 * 255).toInt()),
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Icon(Icons.add, size: 20.sp, color: Colors.white),
                ),
              ],
            ),
            Spacer(),
            CustomSearchAnchor(),
          ],
        ),
      ),
    );
  }
}
