

import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';

import '../model/date_models.dart';

class CreateDateUsecase {
  final DateRepository dateRepository;

  CreateDateUsecase({required this.dateRepository});

  Future<DateModel> execute(DateModel date) async {
    return await dateRepository.createDate(date);
  }
}
