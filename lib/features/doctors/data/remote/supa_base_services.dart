import 'package:pharmacy_app/features/doctors/data/entitiy/doctor_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabase;

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

  @override
  Future<DoctorEntity> updateDoctor(
    DoctorEntity oldDoctor,
    DoctorEntity newDoctor,
  ) async {
    await supabase
        .from('doctors')
        .update({
          'name_doctor': newDoctor.doctorName,
          'spicility': newDoctor.spicility,
          'address': newDoctor.address,
          'phone': newDoctor.phone,
          'image_url': newDoctor.imageUrl,
        })
        .eq('doctor_id', oldDoctor.doctorId);

    return newDoctor;
  }

  Future<void> deleteDoctor(String doctorId) async {
    await supabase.from('doctors').delete().eq('doctor_id', doctorId);
  }
}
