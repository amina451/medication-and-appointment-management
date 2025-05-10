import 'package:dartz/dartz.dart' as oldDoctor;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/repo/images_repo.dart';
import 'package:pharmacy_app/features/doctors/data/entitiy/doctor_entity.dart';
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/create_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/delete_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/edit_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/get_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';

class DoctorsCubit extends Cubit<DoctorState> {
  final GetDoctorUsecase getDoctorUsecase;
  final CreateDoctorUsecase createDoctorUsecase;
  final EditeDoctorUsecase editeDoctorUsecase;
  final DeleteDoctorUsecase deleteDoctorUsecase;

  DoctorsCubit({
    required this.imagesRepo,
    required this.getDoctorUsecase,
    required this.createDoctorUsecase,
    required this.editeDoctorUsecase,
    required this.deleteDoctorUsecase,
  }) : super(DoctorInitial()) {
    fetchDoctors();
  }

  final ImagesRepo imagesRepo;

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorLoading());
      final doctors = await getDoctorUsecase.execute();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> createDoctor(DoctorModel doctor) async {
    try {
      final currentState = state;
      if (currentState is DoctorLoaded) {
        var result = await imagesRepo.uploadImage(doctor.image);

        final createdDoctors = await createDoctorUsecase.execute(doctor);
        emit(DoctorLoaded([...currentState.doctors, createdDoctors]));
      }
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> updateDoctors(
    DoctorModel oldDoctors,
    DoctorModel newDoctors,
  ) async {
    try {
      final currentState = state;
      if (currentState is DoctorLoaded) {
        final updatedDoctor = await editeDoctorUsecase.execute(
          oldDoctors,
          newDoctors,
        );
        final updatedDoctors =
            currentState.doctors.map((Doctor) {
              // ignore: unrelated_type_equality_checks
              if (Doctor.doctorId == oldDoctor.id) return updatedDoctor;
              return Doctor;
            }).toList();
        emit(DoctorLoaded(updatedDoctors));
      }
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> deleteDoctor(int id) async {
    try {
      final currentState = state;
      if (currentState is DoctorLoaded) {
        await deleteDoctorUsecase.execute(id);
        // ignore: unrelated_type_equality_checks
        final updatedDoctorss =
            currentState.doctors.where((t) => t.doctorId != id).toList();
        emit(DoctorLoaded(updatedDoctorss));
      }
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchDoctors();
  }
}
