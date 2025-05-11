import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomShowMore extends StatelessWidget {
  const CustomShowMore({super.key, required this.isExpanded, this.onPressed});
  final bool isExpanded;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: IconButton(
        onPressed: onPressed,
        icon: Row(
          spacing: 5.w,
          children: [
            Icon(
              Icons.remove_red_eye,
              size: 20.sp,
              color: AppColor.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                isExpanded ? "Show Less" : "Show More",
                style: AppTextStyle.semiBold12.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
