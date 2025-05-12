
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';

class GetDateUsecase {
  final DateRepository dateRepository;

  GetDateUsecase({required this.dateRepository});

  Future<List<DateModel>> execute() async {
    return await dateRepository.fetchDates();
  }
}
