import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/auth/views/screens/sing_up_view.dart';

class HaveOrDontHAveAnAcount extends StatelessWidget {
  const HaveOrDontHAveAnAcount({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
  });

  final String firstTitle, secondTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstTitle,
              style: AppTextStyle.semiBold12.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignUpView.routeName);
              },
              child: Text(
                secondTitle,
                style: AppTextStyle.semiBold12.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
