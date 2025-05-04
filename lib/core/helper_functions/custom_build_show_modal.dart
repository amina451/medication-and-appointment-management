import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/upload_image.dart';
import 'package:pharmacy_app/features/auth/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';

void customBuildShowModalSheet(
  BuildContext context,
  void Function() onPressed,
  String nameDoctor,
  date,
  hintName,
  exp,
  hintExp,
) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
          height: 800.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageUpload(),
                FormTitle(title: hintName),
                CustomFormAddData(hint: nameDoctor),

                FormTitle(title: "Specialty"),
                CustomFormAddData(hint: "Specialty"),

                FormTitle(title: hintExp),
                CustomFormAddData(hint: exp),

                FormTitle(title: "Date"),
                CustomFormAddData(hint: date),

                CustomButton(
                  title: "Save",
                  buttonTitleColor: Colors.white,
                  buttonColor: AppColor.primaryColor,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
