import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class TermsUsePrivacy extends StatelessWidget {
  const TermsUsePrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("By continuing, you agree to ", style: AppTextStyle.semiBold12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Terms of Use",
                style: AppTextStyle.semiBold12.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              TextSpan(text: " and ", style: AppTextStyle.semiBold12),
              TextSpan(
                text: "Privacy Police",
                style: AppTextStyle.semiBold12.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
