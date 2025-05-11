import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class DeleteDoctorUsecase {
  final DoctorRepository doctorRepository;

  DeleteDoctorUsecase(this.doctorRepository);

  Future<void> execute(String doctorId) async {
    await doctorRepository.deleteDoctor(doctorId);
  }
}
