import 'package:pharmacy_app/features/doctors/data/entitiy/doctor_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabase ;

  SupabaseService({required this.supabase});



  Future<List<DoctorEntity>> fetchDoctors() async {
    final response = await supabase.from("doctors").select();
    return response.map((e) => DoctorEntity.fromJson(e)).toList();
  }



  Future<DoctorEntity> createDoctor(DoctorEntity Doctor) async {
    final response =
        await supabase.from("doctors").insert(Doctor.toJson()).select();
    return DoctorEntity.fromJson(response.first);
  }


  Future<DoctorEntity> updateDoctor(DoctorEntity oldDoctor, DoctorEntity newDoctor) async {
    final response = await supabase
        .from("doctors")
        .update(newDoctor.toJson())
        .eq("id", oldDoctor.doctorId)
        .select();
    return DoctorEntity.fromJson(response.first);
  }


  Future<void> deleteDoctor(int id) async {
    await supabase.from("doctors").delete().eq("id", id);
  }
}
