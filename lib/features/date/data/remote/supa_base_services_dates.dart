import 'dart:developer';

import 'package:pharmacy_app/features/date/data/entitiy/date_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceDate {
  final SupabaseClient supabase;

  SupabaseServiceDate({required this.supabase});

  Future<List<DateEntity>> fetchDates() async {
    final response = await supabase.from("date").select();
    return (response as List).map((e) => DateEntity.fromJson(e)).toList();
  }

  Future<DateEntity> createDate(DateEntity Date) async {
    final response = await supabase.from("date").insert(Date.toJson()).select();
    return DateEntity.fromJson(response.first);
  }

  Future<DateEntity> updateDate(DateEntity oldDate, DateEntity newDate) async {
    await supabase
        .from('date')
        .update(newDate.toJson())
        .eq('id_date', oldDate.idDate);

    return newDate;
  }




Future<void> deleteDate(String idDate) async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;
    
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    log('Attempting to delete date with id_date: $idDate and user_id: $userId');

    final response = await supabase
        .from('date')
        .delete()
        .eq('id_date', idDate)
        .eq('user_id', userId)
        .select();

    if (response.isEmpty) {
      throw Exception('Failed to delete date: No record found with id_date $idDate and user_id $userId');
    }

    log('Successfully deleted date with id_date: $idDate');
  }
}
