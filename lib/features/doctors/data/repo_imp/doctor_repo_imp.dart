import 'package:pharmacy_app/features/doctors/data/remote/supa_base_services.dart';
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class DoctorRepoImpl implements DoctorRepository {
  final SupabaseServiceDoctor supabaseServiceDoctor;

  DoctorRepoImpl({required this.supabaseServiceDoctor});

  @override
  Future<List<DoctorModel>> fetchDoctors() async {
    final Doctors = await supabaseServiceDoctor.fetchDoctors();
    return Doctors.map((e) => DoctorModel.mapDoctorEntity(e)).toList();
  }

  @override
  Future<DoctorModel> createDoctor(DoctorModel Doctor) async {
    // ignore: non_constant_identifier_names
    final DoctorEntity = await supabaseServiceDoctor.createDoctor(
      Doctor.toEntity(),
    );
    return DoctorModel.mapDoctorEntity(DoctorEntity);
  }

  @override
  Future<DoctorModel> updateDoctor(
    DoctorModel oldDoctor,
    DoctorModel newDoctor,
  ) async {
    final DoctorEntity = await supabaseServiceDoctor.updateDoctor(
      oldDoctor.toEntity(),
      newDoctor.toEntity(),
    );
    return DoctorModel.mapDoctorEntity(DoctorEntity);
  }

  @override
  Future<void> deleteDoctor(String id) async {
    await supabaseServiceDoctor.deleteDoctor(id);
  }
}
