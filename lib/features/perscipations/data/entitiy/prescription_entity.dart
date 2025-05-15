class PrescriptionEntity {
  final String? idPres;
  final String? nameDoctor;
  final String? userId;
  final String? nameMedication;
  final String? allDateMedication;
  final DateTime? createdAt;
  final String? doctorId;
  final String? medicationId;
  final String? specialty;
  

  PrescriptionEntity( {
    this.specialty,
    this.idPres,
    this.nameDoctor,
    this.userId,
    this.nameMedication,
    this.allDateMedication,
    this.createdAt,
    this.doctorId,
    this.medicationId,
  });

  factory PrescriptionEntity.fromJson(Map<String, dynamic> json) {
  return PrescriptionEntity(
    specialty: json['speciality'] as String? ?? '', // التعامل مع null
    idPres: json['id_pres'] as String?,
    nameDoctor: json['name_doctor'] as String?,
    userId: json['user_id'] as String?,
    nameMedication: json['name_medication'] as String?,
    allDateMedication: json['all_date_medication'] as String?,
    doctorId: json['doctor_id'] as String?,
    medicationId: json['medication_id'] as String?, // إصلاح الخطأ الإملائي
  );
}

  Map<String, dynamic> toJson() {
    return {
      "speciality":specialty,
      'id_pres': idPres,
      'name_doctor': nameDoctor,
      'user_id': userId,
      'name_medication': nameMedication,
      'all_date_medication': allDateMedication,
      'doctor_id': doctorId,
      'medication_id': medicationId,
    };
  }
}