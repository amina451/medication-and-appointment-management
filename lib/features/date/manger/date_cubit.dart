import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/create_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/create_date_usecase.dart' show CreateDateUsecase;
import 'package:pharmacy_app/features/date/domain/uses_case/delete_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/edit_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/get_date_usecase.dart';
import 'package:pharmacy_app/features/date/manger/date_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';







class DatesCubit extends Cubit<DateState> {
  final GetDateUsecase getDatesUsecase;
  final CreateDateUsecase createDateUsecase;
  final EditeDateUsecase editDateUsecase;
  final DeleteDateUsecase deleteDateUsecase;

  DatesCubit({
    required this.getDatesUsecase,
    required this.createDateUsecase,
    required this.editDateUsecase,
    required this.deleteDateUsecase,
  }) : super(DateInitial());

  Future<void> fetchDates() async {
    try {
      emit(DateLoading());
      final Dates = await getDatesUsecase.execute();
      emit(DateLoaded(Dates));
    } catch (e) {
      emit(DateError(e.toString()));
    }
  }

  final currentUserId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> createDate(
    DateModel date,
  ) async {
    try {
      final currentState = state;
      if (currentState is DateLoaded) {
        

        final completeDate = date.copyWith();
        final createdDate =
            await createDateUsecase.execute(completeDate);

        emit(DateLoaded([
          ...currentState.dates,
             createdDate,
        ]));
      }
    } catch (e) {
      emit(DateError(e.toString()));
    }
  }

  Future<void> editDate({
    required DateModel oldDate,
    required DateModel updatedDate,
  }) async {
    try {
      await editDateUsecase.execute(oldDate, updatedDate);
      fetchDates();
    } catch (e) {
      emit(DateError(e.toString()));
    }
  }

  Future<void> deleteDate(String dateId) async {
    try {
      final currentState = state;
      if (currentState is DateLoaded) {
        await deleteDateUsecase.execute(dateId);
        final updatedDates = currentState.dates
            // ignore: unrelated_type_equality_checks
            .where((a) => a.idDate != dateId)
            .toList();
        emit(DateLoaded(updatedDates));
      }
    } catch (e) {
      emit(DateError(e.toString()));
    }
  }

  Future<void> refresh() async {
    await fetchDates();
  }

  void searchDates(String query) async {
    try {
      final currentState = state;
      if (currentState is DateLoaded) {
        if (query.isEmpty) {
          final dates = await getDatesUsecase.execute();
          emit(DateLoaded(dates));
        } else {
          final filteredDates = currentState.dates.where((a) {
            return a.doctorName
                .toLowerCase()
                .contains(query.toLowerCase());
          }).toList();
          emit(DateLoaded(filteredDates));
        }
      }
    } catch (e) {
      emit(DateError(e.toString()));
    }
  }
}
