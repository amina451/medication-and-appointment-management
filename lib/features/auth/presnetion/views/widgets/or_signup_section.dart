import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class OrSignUp extends StatelessWidget {
  const OrSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Center(
          child: Text(
            'ou inscrivez-vous avec',
            style: AppTextStyle.semiBold12.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
