// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/upload_image.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void customBuildShowModalSheetMed(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  final medicationNameController = TextEditingController();
  final potionController = TextEditingController();
  final num_of_dayController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return BlocConsumer<DoctorsCubit, DoctorState>(
        listener: (context, state) {
          if (state is DoctorLoaded) {
            buildShowToast(
              message: 'Doctor added successfully!',
              color: AppColor.primaryColor,
            );
            context.read<DoctorsCubit>().fetchDoctors();
          } else if (state is DoctorError) {
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
            inAsyncCall: state is DoctorLoading ? true : false,
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
                        ImageUpload(key: imageKey),
                        const FormTitle(title: "Medication Name"),

                        CustomFormAddData(
                          hint: "Medication",
                          controller: medicationNameController,
                        ),
                        const FormTitle(title: "Potion"),
                        CustomFormAddData(
                          hint: "Potion",
                          controller: potionController,
                        ),
                        const FormTitle(title: "num_of_day"),
                        CustomFormAddData(
                          hint: "num_of_day",
                         keyboardType:TextInputType.number ,
                          controller: num_of_dayController,
                        ),
                        
                    
                        CustomButton(
                          title: "Save",
                          buttonTitleColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          onPressed: () async {
                            final image = imageKey.currentState?.selectedImage;

                            if (image != null) {
                              final medication = MedicationModel(
                                 medication_id: const Uuid().v4(),
                                 name_medication: medicationNameController.text,
                                 imageUrl: "",
                                  potion: potionController.text,
                                  num_of_day: num_of_dayController.text,
                                  userId: Supabase
                                      .instance
                                      .client
                                      .auth
                                      .currentUser!
                                      .id,
);
                              

                              context.read<MedicationsCubit>().createMedication(
                                medication,
                                image,
                              );
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
