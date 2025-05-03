

import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class ExperienceAndTartedAndHourlyRated extends StatelessWidget {
  const ExperienceAndTartedAndHourlyRated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("18yr", style: AppTextStyle.semiBold12),
              Text("50+", style: AppTextStyle.semiBold12),
              Text("\$25.00", style: AppTextStyle.semiBold12),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Experience",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.grey[400],
              ),
            ),
            Text(
              "Treated",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.grey[400],
              ),
            ),
            Text(
              "Hourly Rate",
              style: AppTextStyle.semiBold12.copyWith(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
