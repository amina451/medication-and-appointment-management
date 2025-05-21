import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/core/widgets/data_text_doctor.dart';
import 'package:pharmacy_app/core/widgets/date_text.dart';
import 'package:pharmacy_app/core/widgets/edit_button.dart';

class CardItemMedication extends StatelessWidget {
  const CardItemMedication({
    super.key,
    required this.name,
    required this.spicility,
    this.address,
    required this.image,
    required this.date,
    this.onDelete,
    this.onEdite,
    required this.routAdmin,
  });

  final String name, spicility, image;
  final String date;
  final String? address;
  final void Function()? onDelete;
  final void Function()? onEdite;
  final String routAdmin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 175.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.lightSecondryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 87.h,
                  width: 92.w,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, size: 40, color: Colors.red),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: DataTextAndButtonRemove(
                  onDelete: onDelete,
                  name: name,
                  spicility: spicility,
                  experience: address ?? 'Non disponible',
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateVisitDoctor(forme: date,title:"forme"),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Column(
                  children: [
                    Text(
                      "Rout Admin",
                      style: AppTextStyle.semiBold12.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),

                    Text(
                      routAdmin,
                      style: AppTextStyle.semiBold12.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              EditButton(onPressed: onEdite),
            ],
          ),
        ],
      ),
    );
  }
}