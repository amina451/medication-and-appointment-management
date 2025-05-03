
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomSchedule extends StatelessWidget {
  const CustomSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      // Replace with your dynamic item count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('10:30am - 11:30am', style: AppTextStyle.semiBold12),
              Text('11:30am - 12:30pm', style: AppTextStyle.semiBold12),
            ],
          ),
        );
      },
    );
  }
}
