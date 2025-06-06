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

void buildShowModalSheetEditDate(BuildContext context, DateModel dateModel) {
  final dayController = TextEditingController(
    text: dateModel.date,
  );
  final doctorController = TextEditingController(
    text: dateModel.doctorName,
  );
  final specialtyController = TextEditingController(
    text: dateModel.specialty,
  );
  final timeController = TextEditingController(
    text: dateModel.time
  );
  final addressController = TextEditingController(
    text: dateModel.address,
  );
  final followUpController = TextEditingController(
    text: dateModel.followUp,
  );
  final noteController = TextEditingController(
    text: dateModel.note,
  );

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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Données enregistrées avec succès !')));
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
                    CustomFormAddData(hint: "Heure", controller: timeController),

                    FormTitle(title: "Adresse"),
                    CustomFormAddData(
                      hint: "Adresse",
                      controller: addressController,
                    ),
                    FormTitle(title: "Suivi"),
                    CustomFormAddData(
                      hint: "Suivi",
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
                      title: state is DateLoading ? "Enregistrement..." : "Enregistrer",
                      buttonTitleColor: Colors.white,
                      buttonColor: AppColor.primaryColor,
                      onPressed: () {
                        final date = dateModel.copyWith(
                          address:addressController.text,
                          followUp: followUpController.text,
                          note: noteController.text,
                          specialty: specialtyController.text,
                          time: timeController.text,
                          date: dayController.text,
                          doctorName: doctorController.text,
                        );

                        context.read<DatesCubit>().editDate(
                          oldDate: dateModel,
                          updatedDate: date,
                        );
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
