
import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';

class DeleteDateUsecase {
  final DateRepository dateRepository;

  DeleteDateUsecase(this.dateRepository);

  Future<void> execute(String dateId) async {
    await dateRepository.deleteDate(dateId);
  }
}
