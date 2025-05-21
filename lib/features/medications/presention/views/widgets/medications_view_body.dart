import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_state.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/medication_card_item.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/search_form.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/show_modal_edite_medication.dart';



class MedicationsViewBody extends StatelessWidget {
  const MedicationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SearchFormMedication(),
          const SizedBox(height: 20),
          BlocConsumer<MedicationsCubit, MedicationState>(
            listener: (context, state) {
              if (state is MedicationError) {
                buildShowToast(message: state.message, color: Colors.red);
                print(state.message);
              }
              if (state is MedicationLoaded) {
             
              
                
                print("Chargement terminé");
              }
            },
            builder: (context, state) {
              if (state is MedicationLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              } else if (state is MedicationLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final medication = state.medication[index];
                      return CardItemMedication(
                        date: medication.forme ?? 'Non disponible',
                        onDelete:
                            () => context
                                .read<MedicationsCubit>()
                                .deleteMedication(
                                  medication.medication_id ?? '',
                                ),
                        routAdmin: medication.rout_admin ?? 'Non disponible',
                        name: medication.name_medication ?? 'Non disponible',
                        spicility: medication.potion ?? 'Non disponible',
                        address: medication.num_of_day ?? 'Non disponible',
                        image: medication.imageUrl ?? '',
                        onEdite:
                            () => customBuildEditMedicationModalSheet(
                              context,
                              medication,
                            ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => SizedBox(height: 10.h),
                    itemCount: state.medication.length,
                  ),
                );
              } else if (state is MedicationError) {
                return const Center(
                  child: Text(
                    'Une erreur s\'est produite lors du chargement des médicaments.',
                  ),
                );
              }

              return const Center(child: Text('Aucun médicament disponible.'));
            },
          ),
        ],
      ),
    );
  }
}
