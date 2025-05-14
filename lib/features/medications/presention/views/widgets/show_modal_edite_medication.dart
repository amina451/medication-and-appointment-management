import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/services/supabase_storage_services.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/upload_image.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_state.dart';

void customBuildEditMedicationModalSheet(
  BuildContext context,
  MedicationModel medication,
) {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  // التحقق من null عند تعيين القيم في الـ Controllers
  final medicationNameController = TextEditingController(
    text: medication.name_medication?.isNotEmpty == true
        ? medication.name_medication
        : '',
  );
  final potionController = TextEditingController(
    text: medication.potion ?? '',
  );
  final numOfDayController = TextEditingController(
    text: medication.num_of_day ?? '',
  );

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
            buildShowToast(
              message: 'Medication updated successfully!',
              color: AppColor.primaryColor,
            );
            context.read<MedicationsCubit>().fetchMedications();
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageUpload(
                          key: imageKey,
                          initialImageUrl: medication.imageUrl ?? '',
                        ),
                        const FormTitle(title: "Medication Name"),
                        CustomFormAddData(
                          hint: "Medication",
                          controller: medicationNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter medication name';
                            }
                            return null;
                          },
                        ),
                        const FormTitle(title: "Potion"),
                        CustomFormAddData(
                          hint: "Potion",
                          controller: potionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter potion';
                            }
                            return null;
                          },
                        ),
                        const FormTitle(title: "num_of_day"),
                        CustomFormAddData(
                          hint: "num_of_day",
                          keyboardType: TextInputType.number,
                          controller: numOfDayController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter number of days';
                            }
                            return null;
                          },
                        ),
                        CustomButton(
                          title: "Save",
                          buttonTitleColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          onPressed: () async {
                            FocusScope.of(context).unfocus();

                            if (!formKey.currentState!.validate()) return;

                            final image = imageKey.currentState?.selectedImage;
                            String finalImageUrl = medication.imageUrl ?? '';

                            if (image != null) {
                              final helper = ImageUploadHelper();
                              final uploadedUrl = await helper.uploadImage(
                                image,
                                "medication-images", // تغيير "doctor-images" لـ "medication-images"
                              );

                              if (uploadedUrl != null) {
                                finalImageUrl = uploadedUrl;
                              } else {
                                buildShowToast(
                                  message: "Failed to upload image",
                                  color: Colors.red,
                                );
                                return;
                              }
                            }

                            final updatedMedication = medication.copyWith(
                              imageUrlCopy: finalImageUrl,
                              doctorNameCopy: medicationNameController.text,
                              potionCopy: potionController.text,
                              num_of_dayCopy: numOfDayController.text,
                            );

                            context.read<MedicationsCubit>().editMedication(
                              oldMedication: medication,
                              updatedMedication: updatedMedication,
                            );

                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
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