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
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';

void customBuildEditDoctorModalSheet(BuildContext context, DoctorModel doctor) {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  final firstNameController = TextEditingController(
    text: doctor.doctorName.split(" ").first,
  );
  final lastNameController = TextEditingController(
    text: doctor.doctorName.split(" ").last,
  );
  final spicilityController = TextEditingController(text: doctor.spicility);
  final addressController = TextEditingController(text: doctor.address);
  final phoneController = TextEditingController(text: doctor.phone);

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
              message: 'Doctor updated successfully!',
              color: AppColor.primaryColor,
            );
          } else if (state is DoctorError) {
            buildShowToast(message: state.message, color: Colors.red.shade500);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: AppColor.primaryColor,
            inAsyncCall: state is DoctorLoading,
            progressIndicator: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageUpload(
                          key: imageKey,
                          initialImageUrl: doctor.imageUrl,
                        ),
                        const FormTitle(title: "First Name Doctor"),
                        CustomFormAddData(
                          hint: "dr.",
                          controller: firstNameController,
                        ),
                        const FormTitle(title: "Last Name Doctor"),
                        CustomFormAddData(
                          hint: "Last Name Doctor",
                          controller: lastNameController,
                        ),
                        const FormTitle(title: "spicility"),
                        CustomFormAddData(
                          hint: "spicility",
                          controller: spicilityController,
                        ),
                        const FormTitle(title: "Address"),
                        CustomFormAddData(
                          hint: "Address",
                          controller: addressController,
                        ),
                        const FormTitle(title: "Phone"),
                        CustomFormAddData(
                          hint: "Phone",
                          controller: phoneController,
                        ),
                        CustomButton(
                          title: "Update",
                          buttonTitleColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          onPressed: () async {
                            FocusScope.of(context).unfocus();

                            if (!formKey.currentState!.validate()) return;

                            final image = imageKey.currentState?.selectedImage;
                            String finalImageUrl = doctor.imageUrl;

                            if (image != null) {
                              final helper = ImageUploadHelper();
                              final uploadedUrl = await helper.uploadImage(
                                image,
                                "doctor-images",
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

                            final updatedDoctor = doctor.copyWith(
                              doctorName:
                                  "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
                              spicility: spicilityController.text.trim(),
                              address: addressController.text.trim(),
                              phone: phoneController.text.trim(),
                              imageUrl: finalImageUrl,
                            );

                            await context.read<DoctorsCubit>().editDoctor(
                              oldDoctor: doctor,
                              updatedDoctor: updatedDoctor,
                            );

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
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
