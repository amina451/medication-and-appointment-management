import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class DeleteDoctorUsecase {
  final DoctorRepository doctorRepository;

  DeleteDoctorUsecase({required this.doctorRepository});

  Future<void> execute(int id) async {
    await doctorRepository.deleteDoctor(id);
  }
}
