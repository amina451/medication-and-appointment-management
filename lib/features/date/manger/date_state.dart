import 'package:equatable/equatable.dart';
import 'package:pharmacy_app/features/date/domain/model/date_models.dart';

abstract class DateState extends Equatable {
  const DateState();

  @override
  List<Object?> get props => [];
}

class DateInitial extends DateState {}

class DateLoading extends DateState {}

class DateLoaded extends DateState {
  final List<DateModel> dates;

  const DateLoaded(this.dates);

  @override
  List<Object?> get props => [dates];
}

class DateError extends DateState {
  final String message;

  const DateError(this.message);

  @override
  List<Object?> get props => [message];
}
