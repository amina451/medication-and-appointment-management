
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';

abstract class DoctorRepository {
  Future<List<DoctorModel>> fetchDoctors();
  Future<DoctorModel> createDoctor(DoctorModel Doctor);
  Future<DoctorModel> updateDoctor(DoctorModel oldDoctor, DoctorModel newDoctor);
  Future<void> deleteDoctor(int id);
}
