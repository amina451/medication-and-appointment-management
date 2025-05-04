import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/core/widgets/cstom_section_title_header_with_add_card.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/biuld_show_modal_sheet.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/custom_search_anochr.dart';

class HeaderPrescription extends StatelessWidget {
  const HeaderPrescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            CustomSectionTitleHeaderWithAddCard(
              title: "Prescriptions",
              subTitle: '  "Manage Your Prescriptions "',
              onTap: () {
                buildShowModalSheetPrescriptions(context);
              },
            ),
            Spacer(),
            CustomSearchAnchor(),
          ],
        ),
      ),
    );
  }
}

void buildShowModalSheetPrescriptions(BuildContext context) {
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
                FormTitle(title: "Specialty"),
                CustomFormAddData(hint: "Specialty"),
                FormTitle(title: "Day"),
                CustomFormAddData(hint: "Day"),
                Center(child: FormTitle(title: "Medications")),
                FormTitle(title: "Medication"),
                CustomFormAddData(hint: "Name Medication"),
                FormTitle(title: "Specialty"),
                CustomFormAddData(hint: "Specialty"),
                FormTitle(title: "Day"),
                CustomFormAddData(hint: "Day"),

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
