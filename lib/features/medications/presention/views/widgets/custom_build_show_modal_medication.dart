import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/services/local_notifications_services.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/upload_image.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';



void customBuildShowModalSheetMed(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  final medicationNameController = TextEditingController();
  final potionController = TextEditingController();
  final numOfDaycontroller = TextEditingController();
  final routAdminController = TextEditingController();
  final formeController = TextEditingController();
  final notificationHourController = TextEditingController();
  final notificationMinuteController = TextEditingController();
  final nameMedicationController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return BlocConsumer<MedicationsCubit, MedicationState>(
        listener: (context, state) {
          if (state is MedicationLoaded) {
                            print("Chargement terminé");

            context.read<MedicationsCubit>().fetchMedications();
            Navigator.pop(context); // إغلاق النافذة عند النجاح
          } else if (state is MedicationError) {
            buildShowToast(message: state.message, color: Colors.red.shade500);
            log(state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: AppColor.primaryColor,
            progressIndicator: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
            inAsyncCall: state is MedicationLoading,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageUpload(key: imageKey),
                        const FormTitle(title: "Nom du médicament"),
                        CustomFormAddData(
                          hint: "Médicament",
                          controller: medicationNameController,
                        ),
                        CustomFormAddData(
                          hint: "Dosage",
                          controller: potionController,
                        ),
                        CustomFormAddData(
                          hint: "Fréquence",
                          keyboardType: TextInputType.text,
                          controller: numOfDaycontroller,
                        ),
                        CustomFormAddData(
                          hint: "Forme",
                          controller: formeController,
                        ),
                        CustomFormAddData(
                          hint: "Voie d'administration",
                          controller: routAdminController,
                        ),
                        const FormTitle(title: "Notification"),
                        CustomFormAddData(
                          hint: "Nom du médicament",
                          controller: nameMedicationController,
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
                        SizedBox(height: 16.h),
                        CustomButton(
                          title: "Enregistrer",
                          buttonTitleColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          onPressed: () async {
                            final image = imageKey.currentState?.selectedImage;

                            // التحقق من القيم
                            final hour = int.tryParse(notificationHourController.text) ?? -1;
                            final minute = int.tryParse(notificationMinuteController.text) ?? -1;
                            final nameMedication = nameMedicationController.text.trim();

                            if (formKey.currentState!.validate() && image != null && hour >= 0 && hour < 24 && minute >= 0 && minute < 60 && nameMedication.isNotEmpty) {
                              final medication = MedicationModel(
                                rout_admin: routAdminController.text,
                                forme: formeController.text,
                                medication_id: const Uuid().v4(),
                                name_medication: medicationNameController.text,
                                imageUrl: "",
                                potion: potionController.text,
                                num_of_day: numOfDaycontroller.text,
                                userId: Supabase.instance.client.auth.currentUser!.id,
                              );

                              context.read<MedicationsCubit>().createMedication(
                                medication,
                                image,
                              );

                              // جدولة الإشعار
                              await LocalNotificationsServices.showMedicationNotification(
                                hour,
                                minute,
                                nameMedication,
                              );

                              // إغلاق النافذة بعد النجاح
                              Navigator.pop(context);
                            } else {
                              buildShowToast(
                                message: 'Veuillez remplir tous les champs correctement! (Heure: 0-23, Minute: 0-59)',
                                color: Colors.red,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}