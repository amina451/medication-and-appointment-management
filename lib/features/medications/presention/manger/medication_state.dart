import 'package:equatable/equatable.dart';
import 'package:pharmacy_app/features/medications/domain/model/medication_models.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object?> get props => [];
}

class MedicationInitial extends MedicationState {}

class MedicationLoading extends MedicationState {}

class MedicationLoaded extends MedicationState {
  final List<MedicationModel> Medications;

  const MedicationLoaded(this.Medications);

  @override
  List<Object?> get props => [Medications];
}

class MedicationError extends MedicationState {
  final String message;

  const MedicationError(this.message);

  @override
  List<Object?> get props => [message];
}
