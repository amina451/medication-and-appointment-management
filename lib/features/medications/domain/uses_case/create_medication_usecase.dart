
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';

class CreateMedicationUsecase {
  final MedicationRepository medicationRepository;

  CreateMedicationUsecase({required this.medicationRepository});

  Future<MedicationModel> execute(MedicationModel medication) async {
    return await medicationRepository.createMedication(medication);
  }
}
