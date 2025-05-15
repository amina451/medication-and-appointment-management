import 'package:pharmacy_app/features/perscipations/data/entitiy/prescription_entity.dart';

class PrescriptionModel {
  final String idPres;
  final String nameDoctor;
  final String userId;
  final String nameMedication;
  final String allDateMedication;
  final String doctorId;
  final String medicationId;
final String specialty;
  PrescriptionModel({
    required this.specialty,
    required this.idPres,
    required this.nameDoctor,
    required this.userId,
    required this.nameMedication,
    required this.allDateMedication,
    required this.doctorId,
    required this.medicationId,
  });

  factory PrescriptionModel.mapFromEntity(PrescriptionEntity entity) {
    return PrescriptionModel(
      idPres: entity.idPres!,
      nameDoctor: entity.nameDoctor!,
      userId: entity.userId!,
      nameMedication: entity.nameMedication!,
      allDateMedication: entity.allDateMedication!,
      doctorId: entity.doctorId!,
      medicationId: entity.medicationId!,
      specialty: entity.specialty!,
    );
  }

  PrescriptionEntity toEntity() {
    return PrescriptionEntity(
      idPres: idPres,
      nameDoctor: nameDoctor,
      userId: userId,
      nameMedication: nameMedication,
      allDateMedication: allDateMedication,
      doctorId: doctorId,
      medicationId: medicationId,
    );
  }

  PrescriptionModel copyWith({
    String? idPres,
    String? nameDoctor,
    String? userId,
    String? nameMedication,
    String? allDateMedication,
    DateTime? createdAt,
    String? doctorId,
    String? medicationId,
    String?specialty,
  }) {
    return PrescriptionModel(
      idPres: idPres ?? this.idPres,
      nameDoctor: nameDoctor ?? this.nameDoctor,
      userId: userId ?? this.userId,
      nameMedication: nameMedication ?? this.nameMedication,
      allDateMedication: allDateMedication ?? this.allDateMedication,
      doctorId: doctorId ?? this.doctorId,
      medicationId: medicationId ?? this.medicationId, 
      specialty: specialty ?? this.specialty,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrescriptionModel &&
          runtimeType == other.runtimeType &&
          idPres == other.idPres;

  @override
  int get hashCode => idPres.hashCode;
}