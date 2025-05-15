import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';

void buildShowModalSheetPrescriptionsEdit(BuildContext context, PrescriptionModel prescriptionModel) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (BuildContext context) {
      return _PrescriptionForm(prescriptionModel: prescriptionModel);
    },
  );
}

class _PrescriptionForm extends StatefulWidget {
  final PrescriptionModel prescriptionModel;

  const _PrescriptionForm({required this.prescriptionModel});

  @override
  __PrescriptionFormState createState() => __PrescriptionFormState();
}

class __PrescriptionFormState extends State<_PrescriptionForm> {
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
  void initState() {
    super.initState();
    // Définir les valeurs initiales à partir de prescriptionModel
    doctorNameController.text = widget.prescriptionModel.nameDoctor;
    doctorSpecialityController.text = widget.prescriptionModel.specialty;
    dateMedicationController.text = widget.prescriptionModel.allDateMedication;

    // Analyser les médicaments
    final medications = widget.prescriptionModel.nameMedication.split(', ');
    if (medications.isNotEmpty) {
      final firstMed = medications[0].split(' - ');
      if (firstMed.length >= 2) {
        firstMedicationNameController.text = firstMed[0].trim();
        final details = firstMed[1].split('(');
        if (details.length >= 2) {
          firstMedicationDosageController.text = details[0].trim();
          firstMedicationInstructionsController.text = details[1].replaceAll(')', '').trim();
        }
      }
    }
    if (medications.length > 1) {
      final secondMed = medications[1].split(' - ');
      if (secondMed.length >= 2) {
        secondMedicationNameController.text = secondMed[0].trim();
        final details = secondMed[1].split('(');
        if (details.length >= 2) {
          secondMedicationDosageController.text = details[0].trim();
          secondMedicationInstructionsController.text = details[1].replaceAll(')', '').trim();
        }
      }
    }
  }

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
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormTitle(title: "Modifier l'ordonnance"),
              SizedBox(height: 15.h),
              CustomFormAddData(
                hint: "Nom du médecin",
                controller: doctorNameController,
              ),
              SizedBox(height: 10.h),
              CustomFormAddData(
                hint: "Spécialité",
                controller: doctorSpecialityController,
              ),
              SizedBox(height: 20.h),
              Center(
                child: FormTitle(title: "Médicaments"),
              ),
              SizedBox(height: 15.h),
              CustomFormAddData(
                hint: "Nom du premier médicament",
                controller: firstMedicationNameController,
              ),
              SizedBox(height: 10.h),
              CustomFormAddData(
                hint: "Dosage (ex : 500mg)",
                controller: firstMedicationDosageController,
              ),
              SizedBox(height: 10.h),
              CustomFormAddData(
                hint: "Instructions (ex : 1 comprimé par jour)",
                controller: firstMedicationInstructionsController,
              ),
              SizedBox(height: 15.h),
              CustomFormAddData(
                hint: "Nom du deuxième médicament",
                controller: secondMedicationNameController,
              ),
              SizedBox(height: 10.h),
              CustomFormAddData(
                hint: "Dosage (ex : 10mg)",
                controller: secondMedicationDosageController,
              ),
              SizedBox(height: 10.h),
              CustomFormAddData(
                hint: "Instructions (ex : une fois par jour)",
                controller: secondMedicationInstructionsController,
              ),
              SizedBox(height: 20.h),
              CustomFormAddData(
                hint: "Date (AAAA-MM-JJ)",
                controller: dateMedicationController,
              ),
              SizedBox(height: 25.h),
              CustomButton(
                title: "Enregistrer les modifications",
                buttonTitleColor: Colors.white,
                buttonColor: AppColor.primaryColor,
                onPressed: () async {
                  // Valider les entrées
                  if (doctorNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Le nom du médecin est requis")),
                    );
                    return;
                  }
                  if (firstMedicationNameController.text.trim().isEmpty &&
                      secondMedicationNameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Au moins un médicament est requis")),
                    );
                    return;
                  }
                  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(dateMedicationController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Entrez la date au format AAAA-MM-JJ")),
                    );
                    return;
                  }

                  // Créer la liste des médicaments
                  final medications = <String>[];
                  if (firstMedicationNameController.text.trim().isNotEmpty) {
                    final dosage = firstMedicationDosageController.text.trim().isNotEmpty
                        ? firstMedicationDosageController.text.trim()
                        : "Non spécifié";
                    final instructions = firstMedicationInstructionsController.text.trim().isNotEmpty
                        ? firstMedicationInstructionsController.text.trim()
                        : "Aucune instruction";
                    medications.add(
                      '${firstMedicationNameController.text.trim()} - $dosage ($instructions)',
                    );
                  }
                  if (secondMedicationNameController.text.trim().isNotEmpty) {
                    final dosage = secondMedicationDosageController.text.trim().isNotEmpty
                        ? secondMedicationDosageController.text.trim()
                        : "Non spécifié";
                    final instructions = secondMedicationInstructionsController.text.trim().isNotEmpty
                        ? secondMedicationInstructionsController.text.trim()
                        : "Aucune instruction";
                    medications.add(
                      '${secondMedicationNameController.text.trim()} - $dosage ($instructions)',
                    );
                  }

                  final medicationString = medications.join(', ');

                  // Créer l'ordonnance mise à jour
                  final updatedPrescription = widget.prescriptionModel.copyWith(
                    nameDoctor: doctorNameController.text.trim(),
                    specialty: doctorSpecialityController.text.trim(),
                    nameMedication: medicationString,
                    allDateMedication: dateMedicationController.text.trim(),
                  );

                  // Appeler le cubit pour modifier l'ordonnance
                  await context.read<PrescriptionsCubit>().editPrescription(
                    oldPrescription: widget.prescriptionModel,
                    updatedPrescription: updatedPrescription,
                  );

                  // Fermer la bottom sheet
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Precreption mise à jour avec succès")),
                    );
                  }
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}