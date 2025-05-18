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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void customBuildShowModalSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final spicilityController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
 final routAdminController = TextEditingController();
 final formeController = TextEditingController();
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
              message: 'Médecin ajouté avec succès !',
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
                        const FormTitle(title: "Prénom du médecin"),
                        CustomFormAddData(
                          hint: "dr.",
                          controller: firstNameController,
                        ),
                        const FormTitle(title: "Nom du médecin"),
                        CustomFormAddData(
                          hint: "Nom du médecin",
                          controller: lastNameController,
                        ),
                        const FormTitle(title: "Spécialité"),
                        CustomFormAddData(
                          hint: "Spécialité",
                          controller: spicilityController,
                        ),
                        const FormTitle(title: "Adresse"),
                        CustomFormAddData(
                          hint: "Adresse",
                          controller: addressController,
                        ),
                        const FormTitle(title: "Téléphone"),
                        CustomFormAddData(
                          hint: "Téléphone",
                          controller: phoneController,
                        ),
                        const FormTitle(title: "Voie rout admin"),
                        CustomFormAddData(
                          hint: "Voie rout admin",
                          controller: routAdminController,
                        ),
                        CustomButton(
                          title: "Enregistrer",
                          buttonTitleColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          onPressed: () async {
                            final image = imageKey.currentState?.selectedImage;

                            if (image != null) {
                              final doctor = DoctorModel(
                                doctorId: const Uuid().v4(),
                                doctorName:
                                    "${firstNameController.text} ${lastNameController.text}",

                                phone: phoneController.text,
                                spicility: spicilityController.text,
                                address: addressController.text,
                                forme: formeController.text,
                                userId:
                                    Supabase
                                        .instance
                                        .client
                                        .auth
                                        .currentUser!
                                        .id,
                                imageUrl: "", 
                                routAdmin: routAdminController.text, // sera remplacé dans le cubit
                              );

                              context.read<DoctorsCubit>().createDoctor(
                                doctor,
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
