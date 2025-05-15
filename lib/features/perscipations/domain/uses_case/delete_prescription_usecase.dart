
import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';

class DeletePrescriptionUsecase {
  final PrescriptionRepository prescriptionRepository;

  DeletePrescriptionUsecase(this.prescriptionRepository);

  Future<void> execute(String prescriptionId) async {
    await prescriptionRepository.deletePrescription(prescriptionId);
  }
}