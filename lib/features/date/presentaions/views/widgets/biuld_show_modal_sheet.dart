import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/manger/date_cubit.dart';
import 'package:pharmacy_app/features/date/manger/date_state.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void buildShowModalSheet(BuildContext context) {
  final dayController = TextEditingController();
  final doctorController = TextEditingController();
  final specialtyController = TextEditingController();
  final timeController = TextEditingController();
  final addressController = TextEditingController();
  final followUpController = TextEditingController();
  final noteController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return BlocConsumer<DatesCubit, DateState>(
        listener: (context, state) {
          if (state is DateLoaded) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Données enregistrées avec succès !')),
            );
          } else if (state is DateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
              height: 800.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormTitle(title: "Jour"),
                    CustomFormAddData(hint: "Jour", controller: dayController),

                    FormTitle(title: "Nom du médecin"),
                    CustomFormAddData(
                      hint: "Nom du médecin",
                      controller: doctorController,
                    ),

                    FormTitle(title: "Spécialité"),
                    CustomFormAddData(
                      hint: "Spécialité",
                      controller: specialtyController,
                    ),

                    FormTitle(title: "Heure"),
                    CustomFormAddData(
                      hint: "Heure",
                      controller: timeController,
                    ),

                    FormTitle(title: "Adresse"),
                    CustomFormAddData(
                      hint: "Adresse",
                      controller: addressController,
                    ),
                    FormTitle(title: "Motif"),
                    CustomFormAddData(
                      hint: "Motif",
                      controller: followUpController,
                    ),

                    FormTitle(title: "Note"),
                    CustomFormAddData(
                      hint: "Ajouter une note",
                      maxLength: 2,
                      controller: noteController,
                    ),

                    SizedBox(height: 20.h),
                    CustomButton(
                      title:
                          state is DateLoading
                              ? "Enregistrement..."
                              : "Enregistrer",
                      buttonTitleColor: Colors.white,
                      buttonColor: AppColor.primaryColor,
                      onPressed: () {
                        final date = DateModel(
                          idDate: Uuid().v4(),
                          address: addressController.text,
                          time: timeController.text,
                          doctorName: doctorController.text,
                          userId: Supabase.instance.client.auth.currentUser!.id,
                          note: noteController.text,
                          followUp: followUpController.text,
                          date: dayController.text,
                          specialty: specialtyController.text,
                        );

                        context.read<DatesCubit>().createDate(date);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
