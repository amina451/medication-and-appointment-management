class DoctorEntity {
  final String doctorId;
  final String doctorName;
  final String imageUrl;
  final String spicility;
  final String address;
  final String phone;
  final String userId;
  final String routAdmin;
  final String forme;

  DoctorEntity({
    required this.doctorId,
    required this.doctorName,
    required this.imageUrl,
    required this.spicility,
    required this.address,
    required this.phone,
    required this.userId,
    required this.routAdmin,
    required this.forme,
  });

  factory DoctorEntity.fromJson(Map<String, dynamic> json) {
    return DoctorEntity(
      routAdmin: json['rout_admin'] as String,
      doctorId: json['doctor_id'] as String,
      doctorName: json['name_doctor'] as String,
      imageUrl: json['image_url'] as String,
      spicility: json['spicility'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      userId: json['id_user'] as String,
      forme: json['forme'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rout_admin': routAdmin,
      'doctor_id': doctorId,
      'name_doctor': doctorName,
      'image_url': imageUrl,
      'spicility': spicility,
      'address': address,
      'phone': phone,
      'id_user': userId,
      'forme': forme,
    };
  }
}
