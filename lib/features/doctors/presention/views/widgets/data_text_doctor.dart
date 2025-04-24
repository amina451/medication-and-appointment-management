import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/remove_button.dart';

class DataTextDoctor extends StatelessWidget {
  const DataTextDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5.h,
      children: [
        Row(
          children: [
            Text("Dr.Jon", style: AppTextStyle.semiBold20),
            SizedBox(width: 155.w),
            RemoveButton(),
          ],
        ),
        Text(
          "Tooths Dentist",
          style: AppTextStyle.semiBold12.copyWith(color: AppColor.primaryColor),
        ),
        Text(
          "5 Years experience ",
          style: AppTextStyle.semiBold12.copyWith(color: Color(0xff677294)),
        ),
      ],
    );
  }
}
