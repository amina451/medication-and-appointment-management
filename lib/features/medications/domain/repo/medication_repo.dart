import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';

abstract class MedicationRepository {
  Future<List<MedicationModel>> fetchMedications();
  Future<MedicationModel> createMedication(MedicationModel medication);
  Future<MedicationModel> updateMedication(
    MedicationModel oldMedication,
    MedicationModel newMedication,
  );
  Future<void> deleteMedication(String id);
}
