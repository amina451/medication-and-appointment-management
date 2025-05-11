import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/card_item.dart';
import 'package:pharmacy_app/core/widgets/search_form.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_build_show_modal.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/show_modal_edite.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SearchForm(),
          const SizedBox(height: 20),
          BlocBuilder<DoctorsCubit, DoctorState>(
            builder: (context, state) {
              if (state is DoctorLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DoctorLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final doctor = state.doctors[index];
                      return CardItem(
                        onPresed:
                            () => customBuildEditDoctorModalSheet(
                              context,
                              doctor,
                            ),
                        name: doctor.doctorName,
                        spicility: doctor.spicility,
                        address: doctor.address,
                        image: doctor.imageUrl,
                        date: "12",
                        onDelete: () {
                          context.read<DoctorsCubit>().deleteDoctor(
                            doctor.doctorId,
                          );
                        },
                      );
                    },
                    separatorBuilder:
                        (context, index) => SizedBox(height: 10.h),
                    itemCount: state.doctors.length,
                  ),
                );
              } else if (state is DoctorError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('No doctors available.'));
            },
          ),
        ],
      ),
    );
  }
}
