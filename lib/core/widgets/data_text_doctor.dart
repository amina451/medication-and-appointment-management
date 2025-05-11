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
    this.onDelete,
  });
  final String name, specialty;
  final String? experience;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: AppTextStyle.semiBold20),
              Spacer(),
              GestureDetector(onTap: onDelete, child: RemoveButton()),
            ],
          ),
          Text(
            specialty,
            style: AppTextStyle.semiBold12.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          Text(
            experience!,
            style: AppTextStyle.semiBold12.copyWith(color: Color(0xff677294)),
          ),
        ],
      ),
    );
  }
}
