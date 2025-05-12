
import 'package:pharmacy_app/features/date/data/remote/supa_base_services_dates.dart';
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';

class DateRepoImpl implements DateRepository {
  final SupabaseServiceDate supabaseService;

  DateRepoImpl({required this.supabaseService});

  @override
  Future<List<DateModel>> fetchDates() async {
    final Dates = await supabaseService.fetchDates();
    return Dates.map((e) => DateModel.mapFromEntity(e)).toList();
  }

  @override
  Future<DateModel> createDate(DateModel Date) async {
    final entity = await supabaseService.createDate(Date.toEntity());
    return DateModel.mapFromEntity(entity);
  }

  @override
  Future<DateModel> updateDate(
    DateModel oldDate,
    DateModel newDate,
  ) async {
    final updated = await supabaseService.updateDate(
      oldDate.toEntity(),
      newDate.toEntity(),
    );
    return DateModel.mapFromEntity(updated);
  }

  @override
  Future<void> deleteDate(String idDate) async {
    await supabaseService.deleteDate(idDate);
  }
}
