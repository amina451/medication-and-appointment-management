import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/cstom_section_title_header_with_add_card.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/biuld_show_modal_sheet.dart';

class HeaderDateView extends StatelessWidget {
  const HeaderDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 120.h,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: CustomSectionTitleHeaderWithAddCard(
        title: 'Rendez-vous',
        subTitle: 'Gérez vos visites chez le médecin',
        onTap: () {
          buildShowModalSheet(context,);
        },
      ),
    );
  }
}
