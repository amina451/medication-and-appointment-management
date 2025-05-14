import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/date/manger/date_cubit.dart';
import 'package:pharmacy_app/features/date/manger/date_state.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/custom_card_info_date_item.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/custom_table_calender.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/header_date_view.dart';

class DateViewBody extends StatelessWidget {
  const DateViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatesCubit, DateState>(
      listener: (context, state) {
        if (state is DateError) {
          buildShowToast(message: "Error Loading", color: Colors.red);
          log(state.message);
        }
        if (state is DateLoaded) {
          buildShowToast(message: "Done Loaded", color: AppColor.primaryColor);
          log("Done Loaded");
        }
      },
      builder: (context, state) {
        if (state is DateLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor),
          );
        } else if (state is DateLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderDateView(),
                CustomTableCalender(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.dates.length,
                  itemBuilder:
                      (context, index) =>
                          CustomCardInfoDateItem(
                            
                            dateModel: state.dates[index]),
                ),
              ],
            ),
          );
        } else {
          return const Column(
            children: [HeaderDateView(), CustomTableCalender()],
          );
        }
      },
    );
  }
}
