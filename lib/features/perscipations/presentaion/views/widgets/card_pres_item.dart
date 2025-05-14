import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/custom_show_more.dart';

class CardPrescriptionsItem extends StatefulWidget {

  const CardPrescriptionsItem({super.key, });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// اسم الدكتور
          Text(
            'Doctor: ${"widget.prescription.doctorName"}',
            style: AppTextStyle.semiBold20.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 10.h),

          /// عنوان الأدوية
          Text(
            "Medications",
            style: AppTextStyle.semiBold20.copyWith(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),

          /// الأدوية
          Expanded(
            child: ListView.separated(
              itemCount: 8,
              itemBuilder: (context, index) => Text(
                "widget.prescription.medications[index]",
                style: TextStyle(fontSize: 16),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 5),
            ),
          ),

          /// زرار Show More & Edit/Delete
          Row(
            children: [
              CustomShowMore(
                isExpanded: isExpanded,
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 18),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
