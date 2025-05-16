import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void buildShowModalSheetPrescriptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (BuildContext context) {
      return _PrescriptionForm();
    },
  );
}

class _PrescriptionForm extends StatefulWidget {
  @override
  __PrescriptionFormState createState() => __PrescriptionFormState();
}

class __PrescriptionFormState extends State<_PrescriptionForm> {
  // Initialiser les TextEditingControllers
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController doctorSpecialityController = TextEditingController();
  final TextEditingController firstMedicationNameController = TextEditingController();
  final TextEditingController firstMedicationDosageController = TextEditingController();
  final TextEditingController firstMedicationInstructionsController = TextEditingController();
  final TextEditingController secondMedicationNameController = TextEditingController();
  final TextEditingController secondMedicationDosageController = TextEditingController();
  final TextEditingController secondMedicationInstructionsController = TextEditingController();
  final TextEditingController dateMedicationController = TextEditingController();

  @override
  void dispose() {
    doctorNameController.dispose();
    doctorSpecialityController.dispose();
    firstMedicationNameController.dispose();
    firstMedicationDosageController.dispose();
    firstMedicationInstructionsController.dispose();
    secondMedicationNameController.dispose();
    secondMedicationDosageController.dispose();
    secondMedicationInstructionsController.dispose();
    dateMedicationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5.h,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormTitle(title: "Docteur"),
              CustomFormAddData(
                hint: "Nom du docteur",
                controller: doctorNameController,
              ),
              CustomFormAddData(
                hint: "Spécialité",
                controller: doctorSpecialityController,
              ),
              Center(child: FormTitle(title: "Médicaments")),
              CustomFormAddData(
                hint: "Nom du premier médicament",
                controller: firstMedicationNameController,
              ),
              CustomFormAddData(
                hint: "Dosage du premier médicament (ex : 500mg)",
                controller: firstMedicationDosageController,
              ),
              CustomFormAddData(
                hint: "Instructions du premier médicament (ex : 1 comprimé par jour)",
                controller: firstMedicationInstructionsController,
              ),
              CustomFormAddData(
                hint: "Nom du deuxième médicament",
                controller: secondMedicationNameController,
              ),
              CustomFormAddData(
                hint: "Dosage du deuxième médicament (ex : 10mg)",
                controller: secondMedicationDosageController,
              ),
              CustomFormAddData(
                hint: "Instructions du deuxième médicament (ex : une fois par jour)",
                controller: secondMedicationInstructionsController,
              ),
              CustomFormAddData(
                hint: "Date (ex : AAAA-MM-JJ)",
                controller: dateMedicationController,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                title: "Enregistrer",
                buttonTitleColor: Colors.white,
                buttonColor: AppColor.primaryColor,
                onPressed: () async {
                  // Créer la liste des médicaments comme chaînes avec dosage et instructions
                  final medications = <String>[];
                  if (firstMedicationNameController.text.isNotEmpty) {
                    medications.add(
                      '${firstMedicationNameController.text} \n ${firstMedicationDosageController.text} (${firstMedicationInstructionsController.text})',
                    );
                  }
                  if (secondMedicationNameController.text.isNotEmpty) {
                    medications.add(
                      '${secondMedicationNameController.text} \n ${secondMedicationDosageController.text} (${secondMedicationInstructionsController.text})',
                    );
                  }

                  // Joindre les médicaments en une seule chaîne
                  final medicationString = medications.join('\n ');

                  // Créer le modèle d'ordonnance
                  final prescription = PrescriptionModel(
                    idPres: const Uuid().v4(),
                    userId: Supabase.instance.client.auth.currentUser!.id,
                    nameDoctor: doctorNameController.text,
                    specialty: doctorSpecialityController.text,
                    nameMedication: medicationString,
                    allDateMedication: dateMedicationController.text,
                    doctorId: const Uuid().v4(),
                    medicationId: const Uuid().v4(),
                  );

                  // Appeler le cubit pour créer l'ordonnance
                  await context.read<PrescriptionsCubit>().createPrescription(prescription);

                  // Fermer la bottom sheet seulement après l'opération terminée
                  if (mounted) {
                    Navigator.
                  pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}