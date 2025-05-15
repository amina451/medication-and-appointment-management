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
        Text("En continuant, vous acceptez ", style: AppTextStyle.semiBold12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "les Conditions d'utilisation",
                style: AppTextStyle.semiBold12.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              TextSpan(text: " et la ", style: AppTextStyle.semiBold12),
              TextSpan(
                text: "Politique de confidentialité",
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
