import 'package:pharmacy_app/features/date/data/entitiy/date_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServiceDate {
  final SupabaseClient supabase;

  SupabaseServiceDate({required this.supabase});

  Future<List<DateEntity>> fetchDates() async {
    final response = await supabase.from("date").select();
    return (response as List)
        .map((e) => DateEntity.fromJson(e))
        .toList();
  }

  Future<DateEntity> createDate(DateEntity Date) async {
    final response =
        await supabase.from("date").insert(Date.toJson()).select();
    return DateEntity.fromJson(response.first);
  }

  Future<DateEntity> updateDate(
    DateEntity oldDate,
    DateEntity newDate,
  ) async {
    await supabase
        .from('date')
        .update(newDate.toJson())
        .eq('id_date', oldDate.idDate);

    return newDate;
  }

  Future<void> deleteDate(String idDate) async {
    await supabase
        .from('date')
        .delete()
        .eq('id_date', idDate);
  }

 

}
