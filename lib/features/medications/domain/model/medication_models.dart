import 'package:pharmacy_app/features/medications/data/entitiy/medication_entity.dart';

class MedicationModel {
  final String? medication_id;
  final String? name_medication;
  final String? imageUrl;
  final String? potion;
  final String? num_of_day;
  final String? userId;
  final String? forme;
  final String? rout_admin;   

  MedicationModel( {

required this.forme,
required this.rout_admin,
required this.medication_id,
required this.name_medication,
required this.imageUrl,
required this.potion,
required this.num_of_day,
required this.userId,
  });

  factory MedicationModel.mapMedicationEntity(MedicationEntity entity) {
return MedicationModel(
  medication_id: entity.medication_id,
  name_medication: entity.name_medication,
  imageUrl: entity.imageUrl,
  potion: entity.potion,
  num_of_day: entity.num_of_day,
  userId: entity.userId,
  forme: entity.forme,
  rout_admin: entity.rout_admin,
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
  forme: forme,
  rout_admin: rout_admin,
);
  }

  MedicationModel copyWith({
String? medication_id,
String? name_medication,
String? imageUrl,
String? potion,
String? num_of_day,
String? userId,
String? forme,
String? rout_admin,
  }) {
return MedicationModel(
  medication_id: medication_id ?? this.medication_id,
  name_medication: name_medication ?? this.name_medication,
  imageUrl: imageUrl ?? this.imageUrl,
  potion: potion ?? this.potion,
  num_of_day: num_of_day ?? this.num_of_day,
  userId: userId ?? this.userId,
  forme: forme ?? this.forme,
  rout_admin: rout_admin ?? this.rout_admin,
);
  }

  @override
  bool operator ==(Object other) =>
  identical(this, other) ||
  other is MedicationModel &&
    runtimeType == other.runtimeType &&
    medication_id == other.medication_id;

  @override
  int get hashCode => medication_id?.hashCode ?? 0;
}