import 'package:pharmacy_app/features/medications/data/remote/supa_base_services.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';

class MedicationRepoImpl implements MedicationRepository {
  final SupabaseServiceMedication supabaseService;

  MedicationRepoImpl({required this.supabaseService});

  @override
  Future<List<MedicationModel>> fetchMedications() async {
    final medication = await supabaseService.fetchMedications();
    return medication
        .map((e) => MedicationModel.mapMedicationEntity(e))
        .toList();
  }

  @override
  Future<MedicationModel> createMedication(MedicationModel medication) async {
    final medicationEntity = await supabaseService.createMedication(
      medication.toEntity(),
    );
    return MedicationModel.mapMedicationEntity(medicationEntity);
  }

  @override
  Future<MedicationModel> updateMedication(
    MedicationModel oldMedication,
    MedicationModel newMedication,
  ) async {
    final medicationEntity = await supabaseService.updateMedication(
      oldMedication.toEntity(),
      newMedication.toEntity(),
    );
    return MedicationModel.mapMedicationEntity(medicationEntity);
  }

  @override
  Future<void> deleteMedication(String id) async {
    await supabaseService.deleteMedication(id);
  }
}
