import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_state.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/build_show_modal_pres.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/build_show_modal_pres_edit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/card_pres_item.dart';

class PerescarptionsViewBody extends StatelessWidget {
  const PerescarptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrescriptionsCubit, PrescriptionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prescriptions",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Gérez vos Prescriptions",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      buildShowModalSheetPrescriptions(
                        context,
                      ); // افتراضي لو موجود
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<PrescriptionsCubit, PrescriptionState>(
                listener: (context, state) {
                  if (state is PrescriptionLoaded) {
                    buildShowToast(
                      message: "Chargement terminé",
                      color: AppColor.primaryColor,
                    );
                  } else if (state is PrescriptionError) {
                    buildShowToast(
                      message: "Erreur de chargement : ${state.message}",
                      color: Colors.red,
                    );
                  }
                },
                builder: (context, state) {
                  return Padding(
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
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
