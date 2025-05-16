import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_state.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/build_show_modal_pres_edit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/card_pres_item.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/header_prescrription.dart';

class PerescarptionsViewBody extends StatelessWidget {
  const PerescarptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrescriptionsCubit, PrescriptionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            HeaderPrescription(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: Builder(
                  builder: (context) {
                    if (state is PrescriptionLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      );
                    } else if (state is PrescriptionLoaded) {
                      if (state.prescriptions.isEmpty) {
                        return const Center(
                          child: Text(
                            "Aucune Prescription disponible",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: state.prescriptions.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 15.h),
                        itemBuilder: (context, index) {
                          return CardPrescriptionsItem(
                            pres: state.prescriptions[index],
                            index: index,
                            onPressed: () {
                              buildShowModalSheetPrescriptionsEdit(
                                context,
                                state.prescriptions[index],
                              );
                            },
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Aucune Prescription disponible",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
