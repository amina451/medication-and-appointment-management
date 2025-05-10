
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class CreateDoctorUsecase {
  final DoctorRepository doctorRepository;

  CreateDoctorUsecase({required this.doctorRepository});


  Future<DoctorModel> execute(DoctorModel doctor) async {
    return await doctorRepository.createDoctor(doctor);
  }
}
