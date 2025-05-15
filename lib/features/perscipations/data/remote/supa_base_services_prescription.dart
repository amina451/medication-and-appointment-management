import 'package:pharmacy_app/features/perscipations/data/entitiy/prescription_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServicePrescription {
  final SupabaseClient supabase;

  SupabaseServicePrescription({required this.supabase});

  Future<List<PrescriptionEntity>> fetchPrescriptions() async {
    final response = await supabase.from("prescription").select();
    return (response as List)
        .map((e) => PrescriptionEntity.fromJson(e))
        .toList();
  }

  Future<PrescriptionEntity> createPrescription(PrescriptionEntity prescription) async {
    final response =
        await supabase.from("prescription").insert(prescription.toJson()).select();
    return PrescriptionEntity.fromJson(response.first);
  }

  Future<PrescriptionEntity> updatePrescription(
    PrescriptionEntity oldPrescription,
    PrescriptionEntity newPrescription,
  ) async {
    await supabase
        .from('prescription')
        .update(newPrescription.toJson())
        .eq('id_pres', oldPrescription.idPres!);

    return newPrescription;
  }

  Future<void> deletePrescription(String idPres) async {
    await supabase
        .from('prescription')
        .delete()
        .eq('id_pres', idPres);
  }
}