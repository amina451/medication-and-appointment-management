import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/create_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/delete_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/edit_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/get_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PrescriptionsCubit extends Cubit<PrescriptionState> {
  final GetPrescriptionUsecase getPrescriptionsUsecase;
  final CreatePrescriptionUsecase createPrescriptionUsecase;
  final EditPrescriptionUsecase editPrescriptionUsecase;
  final DeletePrescriptionUsecase deletePrescriptionUsecase;

  PrescriptionsCubit({
    required this.getPrescriptionsUsecase,
    required this.createPrescriptionUsecase,
    required this.editPrescriptionUsecase,
    required this.deletePrescriptionUsecase,
  }) : super(PrescriptionInitial());

  Future<void> fetchPrescriptions() async {
    try {
      emit(PrescriptionLoading());
      final prescriptions = await getPrescriptionsUsecase.execute();

      emit(PrescriptionLoaded(prescriptions));
    } catch (e) {
      emit(PrescriptionError(e.toString()));
    }
  }

  final currentUserId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> createPrescription(PrescriptionModel prescription) async {
    try {
      final currentState = state;
      if (currentState is PrescriptionLoaded) {
        final completePrescription = prescription.copyWith();
        final createdPrescription = await createPrescriptionUsecase.execute(
          completePrescription,
        );
        await refresh();
        emit(
          PrescriptionLoaded([
            ...currentState.prescriptions,
            createdPrescription,
          ]),
        );
      }
    } catch (e) {
      emit(PrescriptionError(e.toString()));
    }
  }

  Future<void> editPrescription({
    required PrescriptionModel oldPrescription,
    required PrescriptionModel updatedPrescription,
  }) async {
    try {
      await editPrescriptionUsecase.execute(
        oldPrescription,
        updatedPrescription,
      );
      fetchPrescriptions();
    } catch (e) {
      emit(PrescriptionError(e.toString()));
    }
  }

  Future<void> deletePrescription(String prescriptionId) async {
    try {
      final currentState = state;
      if (currentState is PrescriptionLoaded) {
        await deletePrescriptionUsecase.execute(prescriptionId);
        final updatedPrescriptions =
            currentState.prescriptions
                // ignore: unrelated_type_equality_checks
                .where((a) => a.idPres != prescriptionId)
                .toList();
        emit(PrescriptionLoaded(updatedPrescriptions));
      }
    } catch (e) {
      emit(PrescriptionError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchPrescriptions();
  }

  void searchPrescriptions(String query) async {
    try {
      final currentState = state;
      if (currentState is PrescriptionLoaded) {
        if (query.isEmpty) {
          final prescriptions = await getPrescriptionsUsecase.execute();
          emit(PrescriptionLoaded(prescriptions));
        } else {
          final filteredPrescriptions =
              currentState.prescriptions.where((a) {
                return a.nameDoctor.toLowerCase().contains(query.toLowerCase());
              }).toList();
          emit(PrescriptionLoaded(filteredPrescriptions));
        }
      }
    } catch (e) {
      emit(PrescriptionError(e.toString()));
    }
  }
}
