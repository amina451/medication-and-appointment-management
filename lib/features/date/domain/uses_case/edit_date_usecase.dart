import 'package:pharmacy_app/features/date/domain/model/date_models.dart';
import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';

class EditeDateUsecase {
  final DateRepository dateRepository;

  EditeDateUsecase(this.dateRepository);

  Future<DateModel> execute(DateModel oldDate, DateModel newDate) async {
    return await dateRepository.updateDate(oldDate, newDate);
  }
}
