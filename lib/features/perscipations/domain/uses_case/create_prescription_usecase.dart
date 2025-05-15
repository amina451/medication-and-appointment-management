

import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';

import '../model/prescription_models.dart';

class CreatePrescriptionUsecase {
  final PrescriptionRepository prescriptionRepository;

  CreatePrescriptionUsecase({required this.prescriptionRepository});

  Future<PrescriptionModel> execute(PrescriptionModel prescription) async {
    return await prescriptionRepository.createPrescription(prescription);
  }
}
