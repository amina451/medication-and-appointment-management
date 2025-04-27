import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/core/widgets/remove_button.dart';

class DataTextAndButtonRemove extends StatelessWidget {
  const DataTextAndButtonRemove({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
  });
  final String name, specialty;
  final String? experience;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5.h,
      children: [
        Row(
          spacing: 10 * 15,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: AppTextStyle.semiBold20),
            RemoveButton(),
          ],
        ),
        Text(
          specialty,
          style: AppTextStyle.semiBold12.copyWith(color: AppColor.primaryColor),
        ),
        Text(
          experience!,
          style: AppTextStyle.semiBold12.copyWith(color: Color(0xff677294)),
        ),
      ],
    );
  }
}
