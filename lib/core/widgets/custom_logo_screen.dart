import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/core/widgets/custom_animated_logo.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    required this.imageLogo,
    required this.colorTitle,
    required this.colorSupTitle,
  });
  final String imageLogo;
  final Color colorTitle, colorSupTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 0.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLogoAnimation(imageLogo: imageLogo),
          SizedBox(height: 19.h),
          Text(
            "Skin\nFirts",
            style: AppTextStyle.then48.copyWith(height: 0.8, color: colorTitle),
          ),
          SizedBox(height: 19.h),
          Text(
            "Dermatology center",
            style: AppTextStyle.semiBold12.copyWith(color: colorSupTitle),
          ),
        ],
      ),
    );
  }
}
