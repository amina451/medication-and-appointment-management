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
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return _EditMedicationModalContent(medication: medication);
    },
  );
}

class _EditMedicationModalContent extends StatefulWidget {
  final MedicationModel medication;
  const _EditMedicationModalContent({Key? key, required this.medication}) : super(key: key);

  @override
  State<_EditMedicationModalContent> createState() => _EditMedicationModalContentState();
}

class _EditMedicationModalContentState extends State<_EditMedicationModalContent> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ImageUploadState> imageKey = GlobalKey();

  late final TextEditingController medicationNameController;
  late final TextEditingController potionController;
  late final TextEditingController numOfDayController;
  late final TextEditingController routAdminController;
  late final TextEditingController formeController;

  @override
  void initState() {
    super.initState();
    medicationNameController = TextEditingController(
      text: widget.medication.name_medication?.isNotEmpty == true
          ? widget.medication.name_medication
          : '',
    );
    potionController = TextEditingController(text: widget.medication.potion ?? '');
    numOfDayController = TextEditingController(text: widget.medication.num_of_day ?? '');
    routAdminController = TextEditingController(text: widget.medication.rout_admin ?? '');
    formeController = TextEditingController(text: widget.medication.forme ?? '');
  }

  @override
  void dispose() {
    medicationNameController.dispose();
    potionController.dispose();
    numOfDayController.dispose();
    routAdminController.dispose();
    formeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicationsCubit, MedicationState>(
      listener: (context, state) {
        if (state is MedicationLoaded) {
          buildShowToast(
            message: 'Médicament mis à jour avec succès !',
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
                    spacing: 5.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageUpload(
                        key: imageKey,
                        initialImageUrl: widget.medication.imageUrl ?? '',
                      ),
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
                        controller: numOfDayController,
                      ),
                      CustomFormAddData(
                        hint: "Forme",
                        controller: formeController,
                      ),
                      CustomFormAddData(
                        hint: "Voie d'administration",
                        controller: routAdminController,
                      ),
                      CustomButton(
                        title: "Enregistrer",
                        buttonTitleColor: Colors.white,
                        buttonColor: AppColor.primaryColor,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();

                          if (!formKey.currentState!.validate()) return;

                          final image = imageKey.currentState?.selectedImage;
                          String finalImageUrl = widget.medication.imageUrl ?? '';

                          if (image != null) {
                            final helper = ImageUploadHelper();
                            final uploadedUrl = await helper.uploadImage(
                              image,
                              "medication-images",
                            );

                            if (uploadedUrl != null) {
                              finalImageUrl = uploadedUrl;
                            } else {
                              buildShowToast(
                                message: "Échec du téléchargement de l'image",
                                color: Colors.red,
                              );
                              return;
                            }
                          }

                          final updatedMedication = widget.medication.copyWith(
                            rout_admin: routAdminController.text,
                            forme: formeController.text,
                            imageUrl: finalImageUrl,
                            name_medication: medicationNameController.text,
                            potion: potionController.text,
                            num_of_day: numOfDayController.text,
                          );

                          context.read<MedicationsCubit>().editMedication(
                            oldMedication: widget.medication,
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
  }
}
