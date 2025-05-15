
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';

class GetPrescriptionUsecase {
  final PrescriptionRepository prescriptionRepository;

  GetPrescriptionUsecase({required this.prescriptionRepository});

  Future<List<PrescriptionModel>> execute() async {
    return await prescriptionRepository.fetchPrescriptions();
  }
}