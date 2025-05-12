import 'package:pharmacy_app/features/date/domain/model/date_models.dart';

abstract class DateRepository {
  Future<List<DateModel>> fetchDates();
  Future<DateModel> createDate(DateModel date);
  Future<DateModel> updateDate(DateModel oldDate, DateModel newDate);
  Future<void> deleteDate(String id);
}
