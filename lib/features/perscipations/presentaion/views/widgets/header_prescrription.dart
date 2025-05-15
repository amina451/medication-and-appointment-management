import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/cstom_section_title_header_with_add_card.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/build_show_modal_pres.dart';
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
              subTitle: '  "Gérez vos prescriptions"',
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
