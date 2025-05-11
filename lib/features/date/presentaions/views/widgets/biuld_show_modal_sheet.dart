import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';

void buildShowModalSheet(BuildContext context) {
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
                FormTitle(title: "N.Doctor"),
                CustomFormAddData(hint: "Name Doctor"),

                FormTitle(title: "spicility"),
                CustomFormAddData(hint: "spicility"),

                FormTitle(title: "Day"),
                CustomFormAddData(hint: "Day"),

                FormTitle(title: "Time"),
                CustomFormAddData(hint: "Time"),

                FormTitle(title: "Address"),
                CustomFormAddData(hint: "Address"),

                FormTitle(title: "Diagnosis"),
                CustomFormAddData(hint: "Diagnosis"),

                CustomButton(
                  title: "Save",
                  buttonTitleColor: Colors.white,
                  buttonColor: AppColor.primaryColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
