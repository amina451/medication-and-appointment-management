import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/manger/date_cubit.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/show_modal_edite_dates.dart';










class CustomCardInfoDateItem extends StatelessWidget {
  const CustomCardInfoDateItem({super.key, required this.dateModel});

  final DateModel dateModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            FormTitle(title:  dateModel.date),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5),

            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: AppColor.hintColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      dateModel.doctorName,
                      style: AppTextStyle.semiBold20.copyWith(height: 0.2),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        buildShowModalSheetEditDate(context, dateModel);
                      },
                      icon: Icon(Icons.edit, size: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<DatesCubit>().deleteDate(dateModel.idDate);
                      },
                      icon: Icon(Icons.delete, size: 18),
                    ),
                  ],
                ),
                Text(
                 dateModel.specialty,
                  style: AppTextStyle.semiBold12.copyWith(
                    color: Colors.blueGrey.shade200,
                    height: 0.8,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 20.w),
                Row(
                  children: [
                    Icon(Icons.alarm, size: 18),
                    Text(dateModel.time),
                    SizedBox(width: 10.w),
                    Icon(Icons.location_on, size: 18),
                    Text(dateModel.address),
                  ],
                ),
                Spacer(),
                Text(
                  dateModel.followUp,
                  style: AppTextStyle.semiBold12.copyWith(
                    color: Colors.blueGrey.shade200,
                    height: 0.8,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



