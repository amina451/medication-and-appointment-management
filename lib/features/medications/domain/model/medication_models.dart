import 'package:pharmacy_app/features/medications/data/entitiy/medication_entity.dart';

class MedicationModel {
   final String medication_id;
  final String name_medication;
  final String imageUrl;
  final String potion;
  final String num_of_day;
  final String userId;

  
  MedicationModel({
    required this.medication_id,
    required this.name_medication,
    required this.imageUrl,
    required this.potion,
    required this.num_of_day,
    required this.userId,
  });



  factory MedicationModel.mapMedicationEntity(MedicationEntity doctor) {
    return MedicationModel(
      medication_id: doctor.medication_id,
      name_medication: doctor.name_medication,
      imageUrl: doctor.imageUrl,
      potion: doctor.potion,
      num_of_day: doctor.num_of_day,
      userId: doctor.userId,
    );
  }

  MedicationEntity toEntity() {
    return MedicationEntity(
      medication_id: medication_id,
      name_medication: name_medication,
      imageUrl: imageUrl,
      potion: potion,
      num_of_day: num_of_day,
      userId: userId,
    );
  }

  MedicationModel copyWith({
    String? doctorIdCopy,
    String? doctorNameCopy,
    String? imageUrlCopy,
    String? potionCopy,
    String? num_of_dayCopy,
    String? userIdCopy,
  }) {
    return MedicationModel(
      medication_id: doctorIdCopy ?? medication_id,
      name_medication: doctorNameCopy ?? name_medication,
      imageUrl: imageUrlCopy ?? imageUrl,
      potion: potionCopy ?? potion,
      num_of_day: num_of_dayCopy ?? num_of_day,
      userId: userIdCopy ?? userId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationModel &&
          runtimeType == other.runtimeType &&
          medication_id == other.medication_id;

  @override
  int get hashCode => medication_id.hashCode;
}
