import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/custom_card_info_date_item.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/custom_table_calender.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/header_date_view.dart';

class DateViewBody extends StatelessWidget {
  const DateViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderDateView(),
          CustomTableCalender(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => CustomCardInfoDateItem(),
          ),
        ],
      ),
    );
  }
}
