
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class GetDoctorUsecase {
  final DoctorRepository doctorRepository;

  GetDoctorUsecase({required this.doctorRepository});

  Future<List<DoctorModel>> execute() async {
    return await doctorRepository.fetchDoctors();
  }
}
