import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomSectionTitleHeaderWithAddCard extends StatelessWidget {
  const CustomSectionTitleHeaderWithAddCard({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.semiBold20.copyWith(
            color: Colors.white,
            height: 0.5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTitle,
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
      ],
    );
  }
}
