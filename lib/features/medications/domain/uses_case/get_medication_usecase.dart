

import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';

class GetMedicationUsecase {
  final MedicationRepository medicationRepository;

  GetMedicationUsecase({required this.medicationRepository});

  Future<List<MedicationModel>> execute() async {
    return await medicationRepository.fetchMedications();
  }
}
