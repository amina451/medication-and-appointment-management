import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomCardItemHome extends StatelessWidget {
  const CustomCardItemHome({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.colorTitle,
    required this.colorIcon,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final String imagePath;
  final Color colorTitle, colorIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 10.sp),
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.semiBold20.copyWith(color: colorTitle),
                ),

                Text(
                  subTitle,
                  style: AppTextStyle.semiBold12.copyWith(fontSize: 14.sp),
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ],
            ),
            SvgPicture.asset(imagePath, color: colorIcon, height: 40.h),
          ],
        ),
      ),
    );
  }
}
