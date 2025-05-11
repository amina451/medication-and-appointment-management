
class DoctorEntity {
  final String doctorId;
  final String doctorName;
  final String image;
  final String specialty;
  final String address;
  final String phone;
  final String userId;

  DoctorEntity({
    required this.doctorId,
    required this.doctorName,
    required this.image,
    required this.specialty,
    required this.address,
    required this.phone,
    required this.userId,
  });

  factory DoctorEntity.fromJson(Map<String, dynamic> json) {
    return DoctorEntity(
      doctorId: json['doctor_id'] as String,
      doctorName: json['name_doctor'] as String,
      image: json['image_url'] as String,
      specialty: json['spicility'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      userId: json['id_user'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'name_doctor': doctorName,
      'image_url': image,
      'spicility': specialty,
      'address': address,
      'phone': phone,
      'id_user': userId,
    };
  }
}
