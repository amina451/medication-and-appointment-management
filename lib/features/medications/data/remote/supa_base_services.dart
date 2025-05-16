import 'package:pharmacy_app/features/medications/data/entitiy/medication_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceMedication {
  final SupabaseClient supabase;

  SupabaseServiceMedication({required this.supabase});

  Future<List<MedicationEntity>> fetchMedications() async {
    final response = await supabase.from("medications").select();
    print("Response from Supabase: $response"); // اطبع البيانات
    return response.map((e) => MedicationEntity.fromJson(e)).toList();
  }

  Future<MedicationEntity> createMedication(MedicationEntity medication) async {
    final response =
        await supabase.from("medications").insert(medication.toJson()).select();
    return MedicationEntity.fromJson(response.first);
  }

  Future<MedicationEntity> updateMedication(
    MedicationEntity oldMedication,
    MedicationEntity newMedication,
  ) async {
    await supabase
        .from('medications')
        .update({
          'name_medication': newMedication.name_medication ?? '',
          'potion': newMedication.potion ?? '',
          'num_of_day': newMedication.num_of_day ?? '',
          'imageUrl': newMedication.imageUrl ?? '',
          'rout_admin': newMedication.rout_admin ?? '',
          'forme': newMedication.forme ?? '',
        })
        .eq('medication_id', oldMedication.medication_id ?? '');

    return newMedication;
  }

  Future<void> deleteMedication(String? medicationId) async {
    if (medicationId == null) {
      throw Exception('Medication ID cannot be null');
    }
    await supabase
        .from('medications')
        .delete()
        .eq('medication_id', medicationId);
  }
}