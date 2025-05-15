
import 'package:pharmacy_app/features/perscipations/data/remote/supa_base_services_prescription.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';

class PrescriptionRepoImpl implements PrescriptionRepository {
  final SupabaseServicePrescription supabaseService;

  PrescriptionRepoImpl({required this.supabaseService});

  @override
  Future<List<PrescriptionModel>> fetchPrescriptions() async {
    final prescriptions = await supabaseService.fetchPrescriptions();
    return prescriptions.map((e) => PrescriptionModel.mapFromEntity(e)).toList();
  }

  @override
  Future<PrescriptionModel> createPrescription(PrescriptionModel prescription) async {
    final entity = await supabaseService.createPrescription(prescription.toEntity());
    return PrescriptionModel.mapFromEntity(entity);
  }

  @override
  Future<PrescriptionModel> updatePrescription(
    PrescriptionModel oldPrescription,
    PrescriptionModel newPrescription,
  ) async {
    final updated = await supabaseService.updatePrescription(
      oldPrescription.toEntity(),
      newPrescription.toEntity(),
    );
    return PrescriptionModel.mapFromEntity(updated);
  }

  @override
  Future<void> deletePrescription(String idPres) async {
    await supabaseService.deletePrescription(idPres);
  }
}