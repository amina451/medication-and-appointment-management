
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';

class EditPrescriptionUsecase {
  final PrescriptionRepository prescriptionRepository;

  EditPrescriptionUsecase(this.prescriptionRepository);

  Future<PrescriptionModel> execute(PrescriptionModel oldPrescription, PrescriptionModel newPrescription) async {
    return await prescriptionRepository.updatePrescription(oldPrescription, newPrescription);
  }
}