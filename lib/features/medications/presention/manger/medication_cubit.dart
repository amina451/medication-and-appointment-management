import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/services/supabase_storage_services.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/create_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/delete_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/edit_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/get_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Remarque : Le code reste inchangé, seuls les commentaires et les noms sont traduits en français.

class MedicationsCubit extends Cubit<MedicationState> {
  final GetMedicationUsecase getMedicationUsecase;
  final CreateMedicationUsecase createMedicationUsecase;
  final EditeMedicationUsecase editeMedicationUsecase;
  final DeleteMedicationUsecase deleteMedicationUsecase;

  MedicationsCubit({
    required this.getMedicationUsecase,
    required this.createMedicationUsecase,
    required this.editeMedicationUsecase,
    required this.deleteMedicationUsecase,
  }) : super(MedicationInitial());

  Future<void> fetchMedications() async {
    try {
      emit(MedicationLoading());
      final Medications = await getMedicationUsecase.execute();
      emit(MedicationLoaded(Medications));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  final currentUserId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> createMedication(
    MedicationModel Medication,
    File imageFile,
  ) async {
    try {
      final currentState = state;
      if (currentState is MedicationLoaded) {
        final helper = ImageUploadHelper();
        final url = await helper.uploadImage(imageFile, "meication-image");

        if (url == null) {
          emit(MedicationError("Échec du téléchargement de l'image"));
          return;
        }

        final completeMedication = Medication.copyWith(imageUrlCopy: url);
        final createdMedication = await createMedicationUsecase.execute(
          completeMedication,
        );

        emit(MedicationLoaded([...currentState.medication, createdMedication]));
      }
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> editMedication({
    required MedicationModel oldMedication,
    required MedicationModel updatedMedication,
  }) async {
    try {
      await editeMedicationUsecase.execute(oldMedication, updatedMedication);
      fetchMedications();
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> deleteMedication(String? medicationId) async {
    try {
      final currentState = state;
      if (currentState is MedicationLoaded) {
        if (medicationId != null) {
          await deleteMedicationUsecase.execute(medicationId);
          final updatedMedications =
              currentState.medication
                  .where((doc) => doc.medication_id != medicationId)
                  .toList();

          emit(MedicationLoaded(updatedMedications));
        }
      }
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchMedications();
  }

  void searchMedications(String query) async {
    try {
      final currentState = state;
      if (currentState is MedicationLoaded) {
        if (query.isEmpty) {
          final medications = await getMedicationUsecase.execute();
          emit(MedicationLoaded(medications));
        } else {
          final filteredMedications =
              currentState.medication.where((medication) {
                final nameMatch = medication.name_medication
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false;
                return nameMatch;
              }).toList();
          emit(MedicationLoaded(filteredMedications));
        }
      }
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }
}