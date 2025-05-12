import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';

class EditeMedicationUsecase {
  final MedicationRepository medicationRepository;

  EditeMedicationUsecase(this.medicationRepository);

  Future<MedicationModel> execute(
    MedicationModel oldMed,
    MedicationModel newMed,
  ) async {
    return await medicationRepository.updateMedication(oldMed, newMed);
  }
}
