import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/services/local_notifications_services.dart';
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
  final notificationHourController = TextEditingController();
  final notificationMinuteController = TextEditingController();

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
                    GestureDetector(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          dayController.text =
                              selectedDate.toIso8601String().split('T').first;
                        }
                      },
                      child: AbsorbPointer(
                        child: CustomFormAddData(
                          hint: "Jour (ex: 2025-05-18)",
                          controller: dayController,
                        ),
                      ),
                    ),

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

                    Row(
                      children: [
                        Expanded(
                          child: CustomFormAddData(
                            hint: "Heure (0-23)",
                            keyboardType: TextInputType.number,
                            controller: notificationHourController,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: CustomFormAddData(
                            hint: "Minute (0-59)",
                            keyboardType: TextInputType.number,
                            controller: notificationMinuteController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      title:
                          state is DateLoading
                              ? "Enregistrement..."
                              : "Enregistrer",
                      buttonTitleColor: Colors.white,
                      buttonColor: AppColor.primaryColor,
                      onPressed: () async {
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

                        final hour =
                            int.tryParse(notificationHourController.text) ?? 0;
                        final minute =
                            int.tryParse(notificationMinuteController.text) ??
                            0;

                        await LocalNotificationsServices.showDateNotification(
                          hour,
                          minute,
                          doctorController.text,
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




