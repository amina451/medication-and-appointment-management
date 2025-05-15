
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';

abstract class PrescriptionRepository {
  Future<List<PrescriptionModel>> fetchPrescriptions();
  Future<PrescriptionModel> createPrescription(PrescriptionModel prescription);
  Future<PrescriptionModel> updatePrescription(PrescriptionModel oldPrescription, PrescriptionModel newPrescription);
  Future<void> deletePrescription(String idPres);
}