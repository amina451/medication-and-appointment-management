
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';

class DeleteMedicationUsecase {
  final MedicationRepository medicationRepository;

  DeleteMedicationUsecase(this.medicationRepository);

  Future<void> execute(String medicationId) async {
    await medicationRepository.deleteMedication(medicationId);
  }
}
