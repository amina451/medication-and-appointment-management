class MedicationEntity {
  final String? medication_id;
  final String? name_medication;
  final String? imageUrl;
  final String? potion;
  final String? num_of_day;
  final String? userId;
  final String? forme;
  final String? rout_admin;

  MedicationEntity({
    required this.medication_id,
    required this.name_medication,
    required this.imageUrl,
    required this.potion,
    required this.num_of_day,
    required this.userId,
       required this.rout_admin,
    required this.forme,


  });

  factory MedicationEntity.fromJson(Map<String, dynamic> json) {
    return MedicationEntity(
      medication_id: json['medication_id'] as String? ?? '',
      name_medication: json['name_medication'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      potion: json['potion'] as String? ?? '',
      num_of_day: json['num_of_day'] as String? ?? '',
      userId: json['user_id'] as String? ?? '', 
      rout_admin: json['rout_admin'] as String? ?? '',
      forme: json['forme'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medication_id': medication_id ?? '',
      'name_medication': name_medication ?? '',
      'imageUrl': imageUrl ?? '',
      'potion': potion ?? '',
      'num_of_day': num_of_day ?? '',
      'user_id': userId ?? '',
      'rout_admin': rout_admin ?? '',
      'forme': forme ?? '',
    };
  }
}
