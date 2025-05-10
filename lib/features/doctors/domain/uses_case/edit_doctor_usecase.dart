
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';

class EditeDoctorUsecase {
  final DoctorRepository doctorRepository;

  EditeDoctorUsecase({required this.doctorRepository});

  Future<DoctorModel> execute(DoctorModel oldTodo, DoctorModel newTodo) async {
    return await doctorRepository.updateDoctor(oldTodo, newTodo);
  }
}
