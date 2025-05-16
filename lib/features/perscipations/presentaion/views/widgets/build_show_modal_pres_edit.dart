import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';

void buildShowModalSheetPrescriptionsEdit(
  BuildContext context,
  PrescriptionModel presModel,
) {
  TextEditingController doctorNameController = TextEditingController(
    text: presModel.nameDoctor,
  );
  final TextEditingController doctorSpecialityController =
      TextEditingController(text: presModel.specialty);
  final TextEditingController firstMedicationNameController =
      TextEditingController(text: presModel.nameMedication);

  final TextEditingController dateMedicationController = TextEditingController(
    text: presModel.allDateMedication,
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
              Center(child: FormTitle(title: "Médicaments")),
              SizedBox(height: 15.h),
              CustomFormAddData(
                hint: "Nom du premier médicament",
                controller: firstMedicationNameController,
              ),
              SizedBox(height: 10.h),

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
                  var presModelCopy = presModel.copyWith(
                    nameDoctor: doctorNameController.text,
                    specialty: doctorSpecialityController.text,
                    nameMedication: firstMedicationNameController.text,
                    allDateMedication: dateMedicationController.text,
                  );
                  await context.read<PrescriptionsCubit>().editPrescription(
                    oldPrescription: presModel,
                    updatedPrescription: presModelCopy,
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
