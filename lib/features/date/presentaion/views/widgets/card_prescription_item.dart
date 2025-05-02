import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/custom_show_more.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/info_doctor.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/medication_item.dart';

class CardPrescriptionsItem extends StatefulWidget {
  const CardPrescriptionsItem({super.key, required this.index});
  final int index;

  @override
  State<CardPrescriptionsItem> createState() => _CardPrescriptionsItemState();
}

class _CardPrescriptionsItemState extends State<CardPrescriptionsItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: isExpanded ? 400.h : 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.3, color: AppColor.hintColor),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoDoctor(index: widget.index),

          Text(
            "Medications",
            style: AppTextStyle.semiBold20.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) => MedicationItem(),
              separatorBuilder:
                  (BuildContext context, int index) => SizedBox(height: 5),
            ),
          ),
          Row(
            spacing: 5.w,
            children: [
              CustomShowMore(
                isExpanded: isExpanded,
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 18)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete, size: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
