import 'dart:io';

import 'package:dartz/dartz.dart' as oldDoctor;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/services/supabase_storage_services.dart';
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/create_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/delete_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/edit_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/get_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorsCubit extends Cubit<DoctorState> {
  final GetDoctorUsecase getDoctorUsecase;
  final CreateDoctorUsecase createDoctorUsecase;
  final EditeDoctorUsecase editeDoctorUsecase;
  final DeleteDoctorUsecase deleteDoctorUsecase;

  DoctorsCubit({
    required this.getDoctorUsecase,
    required this.createDoctorUsecase,
    required this.editeDoctorUsecase,
    required this.deleteDoctorUsecase,
  }) : super(DoctorInitial());

  Future<void> fetchDoctors() async {
    try {
      emit(DoctorLoading());
      final doctors = await getDoctorUsecase.execute();
      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  final currentUserId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> createDoctor(DoctorModel doctor, File imageFile) async {
    try {
      final currentState = state;
      if (currentState is DoctorLoaded) {
        final helper = ImageUploadHelper();
        final url = await helper.uploadImage(imageFile, "doctor-images");

        if (url == null) {
          emit(DoctorError("Failed to upload image"));
          return;
        }

        final completeDoctor = doctor.copyWith(imageUrl: url);
        final createdDoctor = await createDoctorUsecase.execute(completeDoctor);

        emit(DoctorLoaded([...currentState.doctors, createdDoctor]));
      }
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> editDoctor({
    required DoctorModel oldDoctor,
    required DoctorModel updatedDoctor,
  }) async {
    try {
      await editeDoctorUsecase.execute(oldDoctor, updatedDoctor);
      fetchDoctors();
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> deleteDoctor(String doctorId) async {
    try {
      final currentState = state;
      if (currentState is DoctorLoaded) {
        await deleteDoctorUsecase.execute(doctorId);
        final updatedDoctors =
            currentState.doctors
                .where((doc) => doc.doctorId != doctorId)
                .toList();

        emit(DoctorLoaded(updatedDoctors));
      }
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchDoctors();
  }

void searchDoctors(String query) async {
  try {
    final currentState = state;
    if (currentState is DoctorLoaded) {
      if (query.isEmpty) {
        // Fetch the full list of doctors again to reset the state
        final doctors = await getDoctorUsecase.execute();
        emit(DoctorLoaded(doctors));
      } else {
        // Filter the doctors based on the query
        final filteredDoctors = currentState.doctors.where((doctor) {
          final nameMatch = doctor.doctorName.toLowerCase().contains(query.toLowerCase());
          final specialtyMatch = doctor.spicility.toLowerCase().contains(query.toLowerCase());
          return nameMatch || specialtyMatch;
        }).toList();
        emit(DoctorLoaded(filteredDoctors));
      }
    }
  } catch (e) {
    emit(DoctorError(e.toString()));
  }
}


}
