import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/card_pres_item.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/header_prescrription.dart';

class PerescarptionsViewBody extends StatelessWidget {

  const PerescarptionsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        const HeaderPrescription(),
        SizedBox(height: 10.h),
      
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                return CardPrescriptionsItem(
                );
              },
            ),
          ),
      ],
    );
  }
}
