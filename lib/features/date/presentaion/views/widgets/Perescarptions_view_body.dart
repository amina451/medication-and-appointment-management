import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pharmacy_app/features/date/presentaion/views/widgets/card_prescription_item.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/header_prescrription.dart';

class PerescarptionsViewBody extends StatelessWidget {
  const PerescarptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        HeaderPrescription(),
        Expanded(
          child: ListView.separated(
            itemBuilder:
                (context, index) => CardPrescriptionsItem(index: index),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}


